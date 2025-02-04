import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/response/mypage/get_mypage_notification_setting_response.dart';
import '../../repository/mypage_repository.dart';

final getAlarmSettingUseCaseProvider = FutureProvider.family<GetMyPageNotificationSettingResponse, GetAlarmSettingUseCase>((ref, request) async {
  final repository = ref.watch(myPageRepositoryProvider);
  return await repository.getMyNotificationSetting();
});

class GetAlarmSettingUseCase {
  GetAlarmSettingUseCase();
}