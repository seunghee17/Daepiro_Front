import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../model/request/onboarding_info_request.dart';
import '../../model/response/nickname_check_response.dart';
import '../../model/response/onboarding_info_response.dart';
part 'onboarding_service.g.dart';

@RestApi()
abstract class OnboardingService {
  factory OnboardingService(Dio dio, {String baseUrl}) = _OnboardingService;
  
  @GET('/v1/users/nickname/{nickname}')
  Future<NicknameCheckResponse> checkNickName({
    @Path('nickname') required String nickname,
  });

  @PUT('/v1/users/onboarding')
  Future<OnboardingInfoResponse> sendOnboardingInfo({
    @Body() required OnboardingInfoRequest onboardingInfoRequest
});

}