import 'package:daepiro/data/model/response/home/home_disaster_history_response.dart';
import 'package:daepiro/data/model/response/home/home_status_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../repository/home_repository.dart';

final getHomeDisasterHistoryUseCaseProvider = FutureProvider
    .family<HomeDisasterHistoryResponse, GetHomeDisasterHistoryUseCase>((ref, request) async {
  final repository = ref.watch(homeRepositoryProvider);
  return await repository.getHomeDisasterHistory();
});

class GetHomeDisasterHistoryUseCase {
  GetHomeDisasterHistoryUseCase();
}
