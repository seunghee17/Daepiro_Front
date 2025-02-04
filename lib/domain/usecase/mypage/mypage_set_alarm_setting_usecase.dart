import 'package:daepiro/data/model/response/basic_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repository/mypage_repository.dart';

final setAlarmSettingUseCaseProvider = FutureProvider.family<BasicResponse, SetAlarmSettingUseCase>((ref, request) async {
  final repository = ref.watch(myPageRepositoryProvider);
  return await repository.setNotificationSetting(request.type);
});

class SetAlarmSettingUseCase {
  final String type;
  SetAlarmSettingUseCase({required this.type});
}