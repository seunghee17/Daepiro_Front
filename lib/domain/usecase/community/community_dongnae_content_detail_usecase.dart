import 'package:daepiro/domain/repository/community_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/response/community/community_dongnae_content_detail_response.dart';

final getCommunityDongNaeContentDetailUseCaseProvider = FutureProvider.family<
    CommunityDongNaeDetailContentResponse,
    CommunityDongNaeContentDetailUseCase>((ref, request) async {
  final repository = ref.watch(communityRepositoryProvider);
  return await repository.getDongNaeDetailContent(id: request.id);
});

class CommunityDongNaeContentDetailUseCase {
  final int id;

  CommunityDongNaeContentDetailUseCase({required this.id});
}
