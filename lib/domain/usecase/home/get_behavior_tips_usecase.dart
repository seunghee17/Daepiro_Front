import 'package:daepiro/data/model/response/basic_response.dart';
import 'package:daepiro/data/model/response/home/behavior_tips_response.dart';
import 'package:daepiro/data/model/response/home/popular_post_response.dart';
import 'package:daepiro/data/model/response/home/disasters_history_response.dart';
import 'package:daepiro/domain/repository/home_repository.dart';
import 'package:daepiro/domain/repository/sponsor_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getBehaviorTipsUsecaseProvider = FutureProvider
    .family<BehaviorTipsResponse, GetBehaviorTipsUsecase>((ref, request) async {
  final repository = ref.watch(homeRepositoryProvider);
  return await repository.getBehaviorTips(request.disasterId);
});

class GetBehaviorTipsUsecase {
  final String disasterId;

  GetBehaviorTipsUsecase({
    required this.disasterId,
});
}
