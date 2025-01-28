import 'package:daepiro/data/model/response/basic_response.dart';
import 'package:daepiro/domain/repository/sponsor_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final modifyCheerUsecaseProvider = FutureProvider
    .family<BasicResponse, ModifyCheerUsecase>((ref, request) async {
  final repository = ref.watch(sponsorRepositoryProvider);
  return await repository.modifyCheer(
    content: request.content,
    id: request.id
  );
});

class ModifyCheerUsecase {
  final String content;
  final String id;

  ModifyCheerUsecase({
    required this.content,
    required this.id,
  });
}
