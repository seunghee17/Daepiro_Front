import 'package:daepiro/domain/repository/juso_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final jusoResultProvider = FutureProvider.family<List<String>, JusoListUseCase>((ref, request) async {
  final repository = ref.watch(jusoRepositoryProvider);
  return await repository.getjusoList(inputJuso: request.inputJuso, currentPage: request.currentPage);
});

class JusoListUseCase {
  final String inputJuso;
  final int currentPage;

  JusoListUseCase({required this.inputJuso, required this.currentPage});
}
