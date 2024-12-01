import 'package:daepiro/data/model/response/home/home_status_response.dart';
import 'package:daepiro/data/repositoryimpl/home/home_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_status_usecase.g.dart';

@riverpod
Future<HomeStatusResponse> getHomeStatusUseCase(GetHomeStatusUseCaseRef ref) async {
  final repository = ref.watch(homeRepositoryProvider);
  return await repository.getHomeStatus();
}