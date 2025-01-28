import 'package:daepiro/data/model/response/basic_response.dart';
import 'package:daepiro/domain/repository/sponsor_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final writeCheerUsecaseProvider = FutureProvider
    .family<BasicResponse, WriteCheerUsecase>((ref, request) async {
  final repository = ref.watch(sponsorRepositoryProvider);
  return await repository.writeCheer(
    content: request.content
  );
});

class WriteCheerUsecase {
  final String content;

  WriteCheerUsecase({
    required this.content,
  });
}
