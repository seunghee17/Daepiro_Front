import 'package:daepiro/data/model/response/sponsor/sponsor_list_response.dart';
import 'package:daepiro/domain/repository/sponsor_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getSponsorListUsecaseProvider = FutureProvider
    .family<SponsorListResponse, GetSponsorListUsecase>((ref, request) async {
  final repository = ref.watch(sponsorRepositoryProvider);
  return await repository.getSponsorList();
});

class GetSponsorListUsecase {
  GetSponsorListUsecase();
}
