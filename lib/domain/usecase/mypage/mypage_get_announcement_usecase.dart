import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/response/mypage/get_mypage_announcement_detail_response.dart';
import '../../repository/mypage_repository.dart';

final getAnnouncementDetailUseCaseProvider = FutureProvider.family<AnnouncementDetailResponse, GetAnnouncementDetailUseCase>((ref, request) async {
  final repository = ref.watch(myPageRepositoryProvider);
  return await repository.getAnnouncementDetail(request.id);
});

class GetAnnouncementDetailUseCase {
  final String id;
  GetAnnouncementDetailUseCase({required this.id});
}