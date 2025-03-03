import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/response/mypage/get_mypage_profiles_response.dart';
import '../../repository/mypage_repository.dart';

final getProfilesUseCaseProvider = FutureProvider.autoDispose.family<GetMyPageProfilesResponse, GetMyPageProfileUseCase>((ref, request) async {
  final repository = ref.watch(myPageRepositoryProvider);
  return await repository.getMyProfiles();
});

class GetMyPageProfileUseCase {
  GetMyPageProfileUseCase();
}