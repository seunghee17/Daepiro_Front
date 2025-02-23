import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/response/community/town_certificate_response.dart';
import '../../repository/community_repository.dart';

final townGetCertificateUseCaseProvider = FutureProvider.family<TownCertificateResponse, TownGetCertificateUseCase> ((ref, request) async {
  final repository = ref.watch(communityRepositoryProvider);
  return await repository.getTownCertificateInfo();
});

class TownGetCertificateUseCase {
  TownGetCertificateUseCase();
}