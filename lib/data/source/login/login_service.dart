import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../model/request/token_request.dart';
import '../../model/response/token_response.dart';
part 'login_service.g.dart';

@RestApi()
abstract class LoginService {
  factory LoginService(Dio dio, {String baseUrl}) = _LoginService;

  @POST('/token/refresh')
  Future<TokenResponse> getTokenResponse({
    @Body() required TokenRequest tokenRequest
  });
}