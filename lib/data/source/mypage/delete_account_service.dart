import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'delete_account_service.g.dart';

@RestApi()
abstract class DeleteAccountService {
  factory DeleteAccountService(Dio dio) = _DeleteAccountService;

  @POST('https://nid.naver.com/oauth2.0/token')
  Future<void> deleteNaverAccount({
    @Query('client_id') required String clientId,
    @Query('client_id') required String client_secret,
    @Query('client_id') required String access_token,
    @Query('client_id') String grant_type = 'delete',
  });
}
