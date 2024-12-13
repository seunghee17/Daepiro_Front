import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/model/response/home/home_disaster_feed_response.dart';
import '../../repository/home_repository.dart';

final getHomeDisasterFeedUseCaseProvider = FutureProvider
    .family<HomeDisasterFeedResponse, GetHomeDisasterFeedUseCase>((ref, request) async {
  final repository = ref.watch(homeRepositoryProvider);
  return await repository.getHomeDisasterFeed();
});

class GetHomeDisasterFeedUseCase {
  GetHomeDisasterFeedUseCase();
}
