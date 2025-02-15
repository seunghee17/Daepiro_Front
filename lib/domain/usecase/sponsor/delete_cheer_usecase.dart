import 'package:daepiro/data/model/response/basic_response.dart';
import 'package:daepiro/domain/repository/sponsor_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteCheerUsecaseProvider = FutureProvider
    .family<BasicResponse, DeleteCheerUsecase>((ref, request) async {
  final repository = ref.watch(sponsorRepositoryProvider);
  return await repository.deleteCheer(
    id: request.id
  );
});

class DeleteCheerUsecase {
  final String id;

  DeleteCheerUsecase({
    required this.id,
  });
}
