import 'package:daepiro/data/model/response/information/around_shelter_list_response.dart';
import 'package:daepiro/data/model/response/information/behavior_list_response.dart';
import 'package:daepiro/domain/repository/information_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getBehaviorListUsecaseProvider = FutureProvider
    .family<BehaviorListResponse, GetBehaviorListUsecase>((ref, request) async {
  final repository = ref.watch(informationRepositoryProvider);
  return await repository.getBehaviorList(
      type: request.type
  );
});

class GetBehaviorListUsecase {
  final String type;

  GetBehaviorListUsecase({
    required this.type,
  });
}
