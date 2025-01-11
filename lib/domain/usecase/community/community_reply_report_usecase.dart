import 'package:daepiro/domain/repository/community_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/request/community_reply_report_request.dart';
import '../../../data/model/response/community_reply_report_response.dart';

final communityReplyReportUseCaseProvider = FutureProvider.family<
    CommunityReplyReportResponse,
    CommunityReplyReportUseCase>((ref, request) async {
  final repository = await ref.watch(communityRepositoryProvider);
  return await repository.communityReplyReport(
      id: request.id,
      communityReplyReportRequest: request.communityReplyReportRequest);
});

class CommunityReplyReportUseCase {
  final int id;
  final CommunityReplyReportRequest communityReplyReportRequest;

  CommunityReplyReportUseCase(
      {required this.id, required this.communityReplyReportRequest});
}
