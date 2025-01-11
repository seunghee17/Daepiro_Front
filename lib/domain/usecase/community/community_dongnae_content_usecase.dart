import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/response/community_dongnae_content_response.dart';
import '../../repository/community_repository.dart';

final getCommunityDongNaeUseCaseProvider = FutureProvider.family<
    CommunityDongnaeContentResponse,
    CommunityDongnaeContentUseCase>((ref, request) async {
  final repository = await ref.watch(communityRepositoryProvider);
  return await repository.getDongNaeContent(
      type: 'DONGNE',
      category: request.category,
      status: request.status,
      address: request.address,
      page: request.page,
      size: request.size);
});

class CommunityDongnaeContentUseCase {
  final String? category;
  final String status;
  final String address;
  final int page;
  final int size;

  CommunityDongnaeContentUseCase({
    required this.category,
    required this.status,
    required this.address,
    required this.page,
    required this.size,
  });
}
