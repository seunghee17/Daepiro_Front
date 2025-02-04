import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/request/set_mypage_inquires_request.dart';
import '../../../data/model/response/basic_response.dart';
import '../../repository/mypage_repository.dart';

final setInquiresUseCaseProvider = FutureProvider.family<BasicResponse, SetInquiresUseCase>((ref, request) async {
  final repository = ref.watch(myPageRepositoryProvider);
  return await repository.setInquires(request.setMyPageInquiresRequest);
});

class SetInquiresUseCase {
  final SetMyPageInquiresRequest setMyPageInquiresRequest;
  SetInquiresUseCase({required this.setMyPageInquiresRequest});
}