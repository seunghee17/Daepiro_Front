import 'package:daepiro/data/model/response/basic_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/request/set_mypage_profiles_request.dart';
import '../../repository/mypage_repository.dart';

final setProfilesUseCaseProvider = FutureProvider.family<BasicResponse, SetMyPageProfileUseCase>((ref, request) async {
  final repository = ref.watch(myPageRepositoryProvider);
  return await repository.setMyProfiles(request.setMypageProfilesRequest);
});

class SetMyPageProfileUseCase {
  final SetMyPageProfilesRequest setMypageProfilesRequest;
  SetMyPageProfileUseCase({required this.setMypageProfilesRequest});
}