import 'package:daepiro/domain/repository/juso_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final getJusoListUseCaseProvider = FutureProvider.family<List<String>, GetJusoListUseCase>((ref, request) async {
  final repository = ref.watch(jusoRepositoryProvider);
  return await repository.getjusoList(inputJuso: request.inputJuso, currentPage: request.currentPage);
});

class GetJusoListUseCase {
  final String inputJuso;
  final int currentPage;

  GetJusoListUseCase({required this.inputJuso, required this.currentPage});
}
