import 'package:daepiro/data/model/response/information/around_shelter_list_response.dart';
import 'package:daepiro/data/model/response/information/behavior_list_response.dart';
import 'package:daepiro/domain/repository/information_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchDisasterTypeUsecaseProvider = FutureProvider
    .family<BehaviorListResponse, SearchDisasterTypeUsecase>((ref, request) async {
  final repository = ref.watch(informationRepositoryProvider);
  return await repository.searchDisasterType(
      keyword: request.keyword
  );
});

class SearchDisasterTypeUsecase {
  final String keyword;

  SearchDisasterTypeUsecase({
    required this.keyword,
  });
}
