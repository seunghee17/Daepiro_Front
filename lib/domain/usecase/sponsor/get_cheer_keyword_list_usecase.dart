import 'package:daepiro/data/model/response/sponsor/cheer_keyword_response.dart';
import 'package:daepiro/domain/repository/sponsor_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getCheerKeywordListUsecaseProvider = FutureProvider
    .family<CheerKeywordResponse, GetCheerKeywordListUsecase>((ref, request) async {
  final repository = ref.watch(sponsorRepositoryProvider);
  return await repository.getCheerKeywordList();
});

class GetCheerKeywordListUsecase {
  GetCheerKeywordListUsecase();
}
