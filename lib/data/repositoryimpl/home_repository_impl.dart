
import 'package:daepiro/data/model/request/register_user_location_request.dart';
import 'package:daepiro/data/model/response/basic_response.dart';
import 'package:daepiro/data/model/response/home/behavior_tips_response.dart';
import 'package:daepiro/data/model/response/home/home_disaster_feed_response.dart';
import 'package:daepiro/data/model/response/home/home_disaster_history_response.dart';
import 'package:daepiro/data/model/response/home/home_status_response.dart';
import 'package:daepiro/data/model/response/home/notification_response.dart';
import 'package:daepiro/data/model/response/home/popular_post_response.dart';
import 'package:daepiro/data/model/response/home/disasters_history_response.dart';
import 'package:daepiro/data/model/response/home/user_address_response.dart';
import 'package:daepiro/data/model/response/information/disaster_contents_list_response.dart';
import 'package:daepiro/data/source/home/home_service.dart';
import 'package:daepiro/domain/repository/home_repository.dart';

import '../model/response/information/around_shelter_list_response.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl({required HomeService service}) : _service = service;
  final HomeService _service;

  @override
  Future<HomeStatusResponse> getHomeStatus() async {
    try {
      final response = await _service.getHomeStatus();
      return response;
    } catch(e) {
      print('재난 발생상태 오류 ${e.toString()}');
      rethrow;
    }
  }

  @override
  Future<HomeDisasterHistoryResponse> getHomeDisasterHistory() async {
    try {
      final response = await _service.getHomeDisasterHistory();
      return response;
    } catch(e) {
      print('재난문자 내역 오류 ${e.toString()}');
      rethrow;
    }
  }

  @override
  Future<HomeDisasterFeedResponse> getHomeDisasterFeed() async {
    try {
      final response = await _service.getHomeDisasterFeed();
      return response;
    } catch(e) {
      print('재난문자 상세 오류 ${e.toString()}');
      rethrow;
    }
  }

  @override
  Future<PopularPostResponse> getPopularPostList(
      String category
  ) async {
    try {
      final response = await _service.getPopularPostList(category: category);
      return response;
    } catch(e) {
      print('인기게시글 조회 오류 ${e.toString()}');
      rethrow;
    }
  }

  @override
  Future<DisastersHistoryResponse> getDisastersHistory() async {
    try {
      final response = await _service.getDisastersHistory();
      return response;
    } catch(e) {
      print('최근 재난문자 내역 조회 오류 ${e.toString()}');
      rethrow;
    }
  }

  @override
  Future<DisasterContentsListResponse> getRecentContents() async {
    try {
      final response = await _service.getRecentContents();
      return response;
    } catch(e) {
      print('최근 정보콘텐츠 조회 오류 ${e.toString()}');
      rethrow;
    }
  }

  @override
  Future<BehaviorTipsResponse> getBehaviorTips(String disasterId) async {
    try {
      final response = await _service.getBehaviorTips(disasterId: disasterId);
      return response;
    } catch(e) {
      print('재난에 대한 행동요령 조회 오류 ${e.toString()}');
      rethrow;
    }
  }

  @override
  Future<NotificationResponse> getNotifications() async {
    try {
      final response = await _service.getNotifications();
      return response;
    } catch(e) {
      print('알림 내역 오류 ${e.toString()}');
      rethrow;
    }
  }

  @override
  Future<UserAddressResponse> getUserAddress() async {
    try {
      final response = await _service.getUserAddress();
      return response;
    } catch(e) {
      print('주소 조회 오류 ${e.toString()}');
      rethrow;
    }
  }

  @override
  Future<BasicResponse> registerUserLocation({
    required RegisterUserLocationRequest body
  }) async {
    try {
      final response = await _service.registerUserLocation(
          body: body
      );
      return response;
    } catch(e) {
      print('사용자 위치 등록 오류 ${e.toString()}');
      rethrow;
    }
  }

  @override
  Future<AroundShelterListResponse> getAroundShelterList({
    required String type
  }) async {
    try {
      final response = await _service.getAroundShelterList(
          type: type
      );
      return response;
    } catch(e) {
      print('주변대피소 조회 오류 ${e.toString()}');
      rethrow;
    }
  }


}
