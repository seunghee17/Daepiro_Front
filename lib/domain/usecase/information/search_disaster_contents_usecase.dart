import 'package:daepiro/data/model/response/information/disaster_contents_list_response.dart';
import 'package:daepiro/data/model/response/information/disaster_contents_response.dart';
import 'package:daepiro/domain/repository/information_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchDisasterContentsUseCaseProvider = FutureProvider
    .family<DisasterContentsListResponse, SearchDisasterContentsUsecase>((ref, request) async {
  final repository = ref.watch(informationRepositoryProvider);
  return await repository.searchDisasterContents(
    keyword: request.keyword,
    size: request.size
  );
});

class SearchDisasterContentsUsecase {
  final String keyword;
  final String size;

  SearchDisasterContentsUsecase({
    required this.keyword,
    required this.size
  });
}
