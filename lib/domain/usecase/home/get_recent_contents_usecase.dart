import 'package:daepiro/domain/repository/home_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/response/information/disaster_contents_list_response.dart';

final getRecentContentsUsecaseProvider = FutureProvider
    .family<DisasterContentsListResponse, GetRecentContentsUsecase>((ref, request) async {
  final repository = ref.watch(homeRepositoryProvider);
  return await repository.getRecentContents();
});

class GetRecentContentsUsecase {
  GetRecentContentsUsecase();
}
