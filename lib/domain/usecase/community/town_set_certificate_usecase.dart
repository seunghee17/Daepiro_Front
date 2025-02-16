import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/request/set_town_certificate_request.dart';
import '../../../data/model/response/basic_response.dart';
import '../../repository/community_repository.dart';

final townSetCertificateUseCaseProvider = FutureProvider.family<BasicResponse, TownSetCertificateUseCase> ((ref, request) async {
  final repository = ref.watch(communityRepositoryProvider);
  return await repository.setTownCertificateInfo(setTownCertificateRequest: request.setTownCertificateRequest);
});

class TownSetCertificateUseCase {
  final SetTownCertificateRequest setTownCertificateRequest;
  TownSetCertificateUseCase({required this.setTownCertificateRequest});
}