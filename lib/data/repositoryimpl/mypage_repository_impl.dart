import 'package:daepiro/data/model/request/set_mypage_disaster_types_request.dart';
import 'package:daepiro/data/model/request/set_mypage_inquires_request.dart';
import 'package:daepiro/data/model/response/basic_response.dart';
import 'package:daepiro/data/model/response/mypage/get_mypage_address_response.dart';
import 'package:daepiro/data/model/response/mypage/get_mypage_articles_response.dart';
import 'package:daepiro/data/model/response/mypage/get_mypage_disaster_types_response.dart';
import 'package:daepiro/data/model/response/mypage/get_mypage_notification_setting_response.dart';
import 'package:daepiro/data/model/response/mypage/get_mypage_profiles_response.dart';
import 'package:daepiro/data/source/mypage/mypage_service.dart';
import 'package:daepiro/domain/repository/mypage_repository.dart';

import '../model/request/set_mypage_profiles_request.dart';

class MyPageRepositoryImpl implements MyPageRepository {
  MyPageRepositoryImpl({required MyPageService service}) : _service = service;
  final MyPageService _service;

  @override
  Future<BasicResponse> getLogOut() async {
    try {
      return await _service.getLogOut();
    } catch(e) {
      print('로그아웃 오류 발생 $e');
      rethrow;
    }
  }

  @override
  Future<GetMyPageProfilesResponse> getMyProfiles() async {
    try {
      return await _service.getMyProfiles();
    } catch(e) {
      print('프로필 조회 오류 발생 $e');
      rethrow;
    }
  }

  @override
  Future<BasicResponse> setMyProfiles(SetMyPageProfilesRequest setMypageProfilesRequest) async {
    try {
      return await _service.setMyProfiles(setMypageProfilesRequest: setMypageProfilesRequest);
    } catch(e) {
      print('프로필 수정 오류 발생 $e');
      rethrow;
    }
  }

  @override
  Future<BasicResponse> setNotificationSetting(String type) async {
    try {
      return await _service.setNotificationSetting(type: type);
    } catch(e) {
      print('마이페이지 알림 설정 오류 발생 $e');
      rethrow;
    }
  }

  @override
  Future<BasicResponse> setDisasterTypes(SetMypageDisasterTypesRequest setMypageDisasterTypesRequest) async {
    try {
      return await _service.setDisasterTypes(setMypageDisasterTypesRequest: setMypageDisasterTypesRequest);
    } catch(e) {
      print('재난 상황 수정중 오류 발생 $e');
      rethrow;
    }
  }

  @override
  Future<GetMyPageDisasterTypesResponse> getMyDisasterTypes() async {
   try {
     return await _service.getMyDisasterTypes();
   } catch(e) {
     print('재난 유형 로드중 오류 발생 $e');
     rethrow;
   }
  }

  @override
  Future<GetMyPageAddressResponse> getMyAddress() async {
    try {
      return await _service.getMyAddress();
    } catch(e) {
      print('주소 로드중 오류 발생 $e');
      rethrow;
    }
  }

  @override
  Future<GetMyPageNotificationSettingResponse> getMyNotificationSetting() async {
    try {
      return await _service.getMyNotificationSetting();
    } catch(e) {
      print('알림 설정 로드중 오류 발생 $e');
      rethrow;
    }
  }

  @override
  Future<BasicResponse> setInquires(SetMyPageInquiresRequest setMypageInquiresRequest) async {
    try {
      return await _service.setInquires(setMypageInquiresRequest: setMypageInquiresRequest);
    } catch(e) {
      print('문의하기 작성도중 에러 발생 $e');
      rethrow;
    }
  }

  @override
  Future<GetMyPageArticlesResponse> getMyArticles( int page, int size) async {
    try {
      return await _service.getMyArticles(page: page, size: size);
    } catch(e) {
      print('내가 쓴글 오류 발생 $e');
      rethrow;
    }
  }
}

