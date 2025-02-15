import 'package:daepiro/data/model/response/basic_response.dart';
import 'package:daepiro/domain/repository/mypage_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final logoutUseCaseProvider = FutureProvider.family<BasicResponse, LogoutUsecase>((ref, request) async {
  final repository = ref.watch(myPageRepositoryProvider);
  return await repository.getLogOut();
});

class LogoutUsecase {
  LogoutUsecase();
}