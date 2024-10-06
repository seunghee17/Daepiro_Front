import 'package:daepiro/data/repositoryimpl/juso_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'juso_result_usecase.g.dart';

@riverpod
Future<List<String>> getjusoList(GetjusoListRef ref, {required String inputJuso, required int currentPage}) async {
  final repository = ref.watch(jusoRepositoryProvider);
  return await repository.getjusoList(inputJuso: inputJuso, currentPage: currentPage);
}