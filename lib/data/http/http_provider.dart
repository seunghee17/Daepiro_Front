import 'package:daepiro/data/http/tokenErrorViewModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as storge;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import '../model/request/refresh_token_request.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../model/response/login/refresh_token_response.dart';

final dioProvider = Provider<Dio>((ref) {
  final options = BaseOptions(
      baseUrl: dotenv.get('BASE_URL'),
      headers: {
        'Content-Type': 'application/json',
      }
  );

  final Dio dio = Dio(options);
  dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      maxWidth: 90,
      enabled: kDebugMode
  ));
  dio.interceptors.add(ref.watch(interceptorProvider(dio)));
  return dio;
});

final communityWriteDioProvider = Provider<Dio>((ref) {
  final options = BaseOptions(
      baseUrl: dotenv.get('BASE_URL'),
      headers: {
        'Content-Type': 'multipart/form-data',
      }
  );

  final Dio dio = Dio(options);
  dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      maxWidth: 90,
      enabled: kDebugMode
  ));
  dio.interceptors.add(ref.watch(interceptorProvider(dio)));
  return dio;
});


final interceptorProvider = Provider.family<InterceptorsWrapper, Dio> ((ref, dio) {
  final storage = storge.FlutterSecureStorage();

  return InterceptorsWrapper(
    onRequest: (options, handler) async {
      //헤더주입이 필요없는 api
      if ((!options.path.contains("/kakao")) && (!options.path.contains("/naver"))
          && (!options.path.contains('/apple')) && (!options.path.contains('/business'))) {
        String? accessToken = await storage.read(key: 'accessToken');
        if (accessToken != null) {
          options.headers['Authorization'] = 'Bearer $accessToken';
        }
      }
      handler.next(options);
    },
    onError: (DioException exception, handler) async {
      //토큰 갱신 요청 실패시 재시도 하지 않음
      if(exception.requestOptions.path.contains('/v1/auth/refresh')) {
        print('토큰 갱신 요청 실패시 재시도 하지 않음:: ');
        handler.next(exception);
        return;
      }
      //네트워크 에러 처리
      if(exception.response?.statusCode == 500) {
        Fluttertoast.showToast(
            msg: '서버 오류가 발생했습니다. 넘버원 서버팀에 문의해주세요.',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.black,
            textColor: Colors.black
        );
      }
      if(exception.response?.statusCode == 401) {
        String? refreshToken = await storage.read(key: 'refreshToken');
        if(refreshToken != null ) {
          try {
            final response = await dio.post(
              '${dotenv.get('BASE_URL')}/v1/auth/refresh',
              data: RefreshTokenRequest(refreshToken: refreshToken),
            );
            final responseData = response.data as Map<String, dynamic>;
            final refreshTokenResponse = RefreshTokenResponse.fromJson(responseData);
            if(refreshTokenResponse.code == 1000) {

              String newAccessToken = refreshTokenResponse.data?.accessToken ?? '';
              String newRefreshToken = refreshTokenResponse.data?.refreshToken ?? '';
              await storage.write(key: 'accessToken', value: newAccessToken);
              await storage.write(key: 'refreshToken', value: newRefreshToken);

              //원래 요청을 재시도
              exception.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
              final opts = Options(
                method: exception.requestOptions.method,
                headers: {
                  ...exception.requestOptions.headers,
                  'Authorization': 'Bearer $newAccessToken',
                }
              );
              final clonedRequest = await dio.request(
                  exception.requestOptions.path,
                options: opts,
                data: exception.requestOptions.data,
                queryParameters: exception.requestOptions.queryParameters
              );
              handler.resolve(clonedRequest);
              return;
            } else {
              //refresh 토큰이 존재하지 않거나 만료되었음 로그인 화면으로 이동해야함
              ref.read(errorNotifierProvider.notifier).addError(exception);
              //저장된 토큰 있다면 리셋 잠시만 비활성화
              await storage.write(key: 'accessToken', value: '');
              await storage.write(key: 'refreshToken', value: '');
            }
          } catch(e) {
            print('토큰 갱신중 에러가 발생함: $e');
            ref.read(errorNotifierProvider.notifier).addError(exception);
          }
        }
      }
      handler.next(exception);
    },
    onResponse: (options, handler) => handler.next(options),
  );
});
