import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/request/withdraw_user_request.dart';
import '../../../data/model/response/basic_response.dart';
import '../../repository/mypage_repository.dart';

final withDrawUseCaseProvider = FutureProvider.family<BasicResponse, WithDrawUseCase>((ref, request) async {
  final repository = ref.watch(myPageRepositoryProvider);
  return await repository.withDrawUserInfo(request.reason, request.withDrawRequest);
});

class WithDrawUseCase {
  final String reason;
  final WithDrawRequest withDrawRequest;
  WithDrawUseCase({required this.reason, required this.withDrawRequest});
}