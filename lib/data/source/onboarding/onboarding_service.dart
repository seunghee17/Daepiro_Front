import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../model/response/nickname_check_response.dart';
part 'onboarding_service.g.dart';

@RestApi()
abstract class OnboardingService {
  factory OnboardingService(Dio dio, {String baseUrl}) = _OnboardingService;
  
  @GET('/v1/users/nickname/{nickname}')
  Future<NicknameCheckResponse> checkNickName({
    @Path('nickname') required String nickname,
  });

}