import 'package:daepiro/data/model/response/information/around_shelter_list_response.dart';
import 'package:daepiro/domain/repository/information_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAroundShelterListUsecaseProvider = FutureProvider
    .family<AroundShelterListResponse, GetAroundShelterListUsecase>((ref, request) async {
  final repository = ref.watch(informationRepositoryProvider);
  return await repository.getAroundShelterList(
      type: request.type
  );
});

class GetAroundShelterListUsecase {
  final String type;

  GetAroundShelterListUsecase({
    required this.type,
  });
}
