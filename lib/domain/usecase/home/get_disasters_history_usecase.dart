import 'package:daepiro/data/model/response/home/disasters_history_response.dart';
import 'package:daepiro/domain/repository/home_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getRecentDisastersUsecaseProvider = FutureProvider
    .family<DisastersHistoryResponse, GetDisastersHistoryUsecase>((ref, request) async {
  final repository = ref.watch(homeRepositoryProvider);
  return await repository.getDisastersHistory();
});

class GetDisastersHistoryUsecase {
  GetDisastersHistoryUsecase();
}
