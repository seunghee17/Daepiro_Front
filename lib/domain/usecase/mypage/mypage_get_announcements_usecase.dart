import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/response/mypage/get_mypage_announcements_list_response.dart';
import '../../repository/mypage_repository.dart';

final getAnnouncementsUseCaseProvider = FutureProvider.family<AnnouncementListResponse, GetAnnouncementsUseCase>((ref, request) async {
  final repository = ref.watch(myPageRepositoryProvider);
  return await repository.getAnnouncements();
});

class GetAnnouncementsUseCase {
  GetAnnouncementsUseCase();
}