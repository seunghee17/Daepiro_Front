import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as storge;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import '../model/request/refresh_token_request.dart';
import 'package:fluttertoast/fluttertoast.dart';
part 'http_provider.g.dart';

@riverpod
Dio http(HttpRef ref) {
  final options = BaseOptions(
    baseUrl: 'http://13.125.2.66',
    headers: {
      'Content-Type': 'application/json',
    }
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
 ));

 dio.interceptors.add(httpInterceptor(ref, dio));
 return dio;
}

@riverpod
InterceptorsWrapper httpInterceptor(HttpRef ref, Dio dio) {
  final storage = storge.FlutterSecureStorage();

  return InterceptorsWrapper(
    onRequest: (options, handler) async {

      //헤더주입이 필요없는 api
      if ((!options.path.contains("/kakao")) && (!options.path.contains("/naver"))
          && (!options.path.contains('/refresh')) && (!options.path.contains('/apple')) && (!options.path.contains('/business'))) {
        String? accessToken = await storage.read(key: 'accessToken');
        if (accessToken != null) {
          options.headers['Authorization'] = 'Bearer $accessToken';
        }
      }
      handler.next(options);
    },
    onError: (DioError error, handler) async {
      //토큰 갱신 요청 실패시 재시도 하지 않음
      if(error.requestOptions.path.contains('/v1/auth/refresh')) {
        print('토큰 갱신 요청 실패시 재시도 하지 않음:: ');
        handler.next(error);
        return;
      }
      //네트워크 에러 처리
      if(error.response?.statusCode == 500) {
        Fluttertoast.showToast(
            msg: '서버 오류가 발생했습니다. 넘버원 서버팀에 문의해주세요.',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.black,
          textColor: Colors.white
        );
      } else {
        Fluttertoast.showToast(
            msg: '네트워크 에러 ${error.response?.statusCode} 발생',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.black,
            textColor: Colors.white
        );
      }
      if(error.response?.statusCode == 401) {
        String? refreshToken = await storage.read(key: 'refreshToken');
        if(refreshToken != null ) {
          try {
            final response = await dio.post(
                'http://13.125.2.66/swagger-ui/index.html#/v1/auth/refresh',
              data: RefreshTokenRequest(refreshToken: refreshToken),
            );
            if(response.statusCode == 200) {
              print('토큰 갱신 성공!!!');
              //토큰 재발급에 성공
              String newAccessToken = response.data['accessToken'];
              String newRefreshToken = response.data['refreshToken'];
              await storage.write(key: 'accessToken', value: newAccessToken);
              await storage.write(key: 'refreshToken', value: newRefreshToken);

              //원래 요청을 재시도
              error.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
              final opts = Options(
                method: error.requestOptions.method,
                headers: error.requestOptions.headers
              );
              final clonedRequest = await dio.request(
                error.requestOptions.path,
                options: opts,
                data: error.requestOptions.data,
                queryParameters: error.requestOptions.queryParameters
              );
              return handler.resolve(clonedRequest);
            } else {
              //refresh 토큰이 존재하지 않거나 만료되었음 로그인 화면으로 이동해야함
              //재로그인이 필요함을 언급
              print('cathch 전');
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
