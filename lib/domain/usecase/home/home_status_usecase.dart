import 'package:daepiro/data/model/response/home/home_status_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../repository/home_repository.dart';

final getHomeStatusUseCaseProvider = FutureProvider.family<HomeStatusResponse, GetHomeStatusUseCase>((ref, request) async {
  final repository = ref.watch(homeRepositoryProvider);
  return await repository.getHomeStatus();
});

class GetHomeStatusUseCase {
  GetHomeStatusUseCase();
}
