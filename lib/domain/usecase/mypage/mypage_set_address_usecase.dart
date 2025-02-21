import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/model/request/set_mypage_address_notification_request.dart';
import '../../../data/model/response/basic_response.dart';
import '../../repository/mypage_repository.dart';

final setAddressUseCaseProvider = FutureProvider.family<BasicResponse, SetAddressUseCase>((ref, request) async {
  final repository = ref.watch(myPageRepositoryProvider);
  return await repository.setMyAddress(request.setMypageAddressNotificationRequest);
});

class SetAddressUseCase {
  final SetMypageAddressNotificationRequest setMypageAddressNotificationRequest;
  SetAddressUseCase({required this.setMypageAddressNotificationRequest});
}