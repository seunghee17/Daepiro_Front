import 'package:daepiro/data/model/request/set_fcm_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/response/basic_response.dart';
import '../../repository/login_repository.dart';

final setFcmTokenUseCaseProvider =
    FutureProvider.family<BasicResponse, SetFcmTokenUseCase>(
        (ref, request) async {
  final repository = ref.watch(loginRepositoryProvider);
  return await repository.setFCMToken(setFcmRequest: request.setFcmRequest);
});

class SetFcmTokenUseCase {
  final SetFcmRequest setFcmRequest;

  SetFcmTokenUseCase({required this.setFcmRequest});
}
