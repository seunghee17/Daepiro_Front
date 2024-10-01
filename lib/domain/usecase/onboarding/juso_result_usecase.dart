import 'package:daepiro/data/model/response/jusolist_response.dart';
import 'package:daepiro/data/repositoryimpl/juso_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'juso_result_usecase.g.dart';

@riverpod
Future<List<Juso>> getjusoList(GetjusoListRef ref, {required String inputJuso}) async {
  final repository = ref.watch(jusoRepositoryProvider);
  return await repository.getjusoList(inputJuso: inputJuso);
}