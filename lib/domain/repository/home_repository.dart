import 'package:daepiro/data/model/response/home/home_disaster_feed_response.dart';
import 'package:daepiro/data/model/response/home/home_disaster_history_response.dart';
import 'package:daepiro/data/model/response/home/home_status_response.dart';
import 'package:daepiro/data/model/response/home/popular_post_response.dart';
import 'package:daepiro/data/source/home/home_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/http/http_provider.dart';
import '../../data/model/response/information/disaster_contents_list_response.dart';
import '../../data/model/response/sponsor/sponsor_list_response.dart';
import '../../data/repositoryimpl/home_repository_impl.dart';

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  final http = ref.watch(dioProvider);
  return HomeRepositoryImpl(service: HomeService(http));
});

abstract class HomeRepository {
  Future<HomeStatusResponse> getHomeStatus();
  Future<HomeDisasterHistoryResponse> getHomeDisasterHistory();
  Future<HomeDisasterFeedResponse> getHomeDisasterFeed();
  Future<PopularPostResponse> getPopularPostList(String category);
}
