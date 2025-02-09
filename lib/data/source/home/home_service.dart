import 'package:daepiro/data/model/response/home/home_disaster_feed_response.dart';
import 'package:daepiro/data/model/response/home/home_disaster_history_response.dart';
import 'package:daepiro/data/model/response/home/home_status_response.dart';
import 'package:daepiro/data/model/response/home/popular_post_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../model/response/information/disaster_contents_list_response.dart';
import '../../model/response/sponsor/sponsor_list_response.dart';
part 'home_service.g.dart';

@RestApi()
abstract class HomeService {
  factory HomeService(Dio dio, {String baseUrl}) = _HomeService;

  // 현재 재난 발생 유무 조회
  @GET('/v1/home/status')
  Future<HomeStatusResponse> getHomeStatus();

  // 재난문자 내역 조회
  @GET('/v1/home/disasters')
  Future<HomeDisasterHistoryResponse> getHomeDisasterHistory();

  // 발생 재난 피드 조회
  @GET('/v1/home/warnings')
  Future<HomeDisasterFeedResponse> getHomeDisasterFeed();

  // 인기 게시글 조회
  @GET('/v1/home/articles')
  Future<PopularPostResponse> getPopularPostList({
    @Query('category') required String category
  });

}
