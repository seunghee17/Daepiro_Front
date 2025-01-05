import 'package:daepiro/data/model/response/information/disaster_contents_response.dart';
import 'package:daepiro/domain/repository/information_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getDisasterContentsUseCaseProvider = FutureProvider
    .family<DisasterContentsResponse, GetDisasterContentsUseCase>((ref, request) async {
  final repository = ref.watch(informationRepositoryProvider);
  return await repository.getDisasterContents();
});

class GetDisasterContentsUseCase {
  GetDisasterContentsUseCase();
}
