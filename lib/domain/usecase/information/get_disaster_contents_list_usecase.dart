import 'package:daepiro/data/model/response/information/disaster_contents_list_response.dart';
import 'package:daepiro/domain/repository/information_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getDisasterContentsListUseCaseProvider = FutureProvider
    .family<DisasterContentsListResponse, GetDisasterContentsListUseCase>((ref, request) async {
  final repository = ref.watch(informationRepositoryProvider);
  return await repository.getDisasterContentsList(
    sortType: request.sortType,
    size: request.size
  );
});

class GetDisasterContentsListUseCase {
  final String sortType;
  final String size;

  GetDisasterContentsListUseCase({
    required this.sortType,
    required this.size
  });
}
