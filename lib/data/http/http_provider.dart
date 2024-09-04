import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

import '../model/request/token_request.dart';
part 'http_provider.g.dart';

@riverpod
Dio http(HttpRef ref) {
  final options = BaseOptions(
    baseUrl: 'http://ec2-15-164-253-33.ap-northeast-2.compute.amazonaws.com',
  );
 final Dio dio = Dio(options);
 dio.interceptors.add( PrettyDioLogger(
   requestHeader: true,
   requestBody: true,
   responseBody: true,
   responseHeader: false,
   error: true,
   maxWidth: 90,
   enabled: kDebugMode
 )

 );
 dio.interceptors.add(ref.read(httpInterceptorProvider));
 return dio;
}

@riverpod
InterceptorsWrapper httpInterceptor(HttpInterceptorRef ref) {
  final storage = FlutterSecureStorage();
  final dio = Dio();

  return InterceptorsWrapper(
    onRequest: (options, handler) async {
      // 로그인 요청 시 URL을 확인
      if ((!options.path.contains("/kakao")) || (!options.path.contains("/naver"))) {
        String? accessToken = await storage.read(key: 'accessToken');
        if (accessToken != null) {
          options.headers['Authorization'] = 'Bearer $accessToken';
        }
      }
      handler.next(options);
    },
    onError: (DioError error, handler) async {
      if(error.response?.statusCode == 401) {
        String? refreshToken = await storage.read(key: 'refreshToken');
        if(refreshToken != null ) {
          try {
            final response = await dio.post('http://ec2-15-164-253-33.ap-northeast-2.compute.amazonaws.com/token/refresh',
              data: TokenRequest(token: refreshToken)
            );
            if(response.statusCode == 200) {
              //토큰 재발급에 성공
              String newAccessToken = response.data['accessToken'];
              String newRefreshToken = response.data['refreshToken'];
              await storage.write(key: 'accessToken', value: newAccessToken);
              await storage.write(key: 'refreshToken', value: newRefreshToken);

              //원래 요청을 재시도
              error.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
              return handler.resolve(await dio.fetch(error.requestOptions));
            } else {
              //refresh 토큰이 존재하지 않거나 만료되었음 로그인 화면으로 이동해야함
              print('Error refreshing token: $error');
            }
          } catch(e) {
            print('Error refreshing token: $e');
          }
        }
      }
      handler.next(error);
    },
    onResponse: (options, handler) => handler.next(options),
  );
}
