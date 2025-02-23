import 'package:daepiro/data/http/http_provider.dart';
import 'package:daepiro/data/source/mypage/mypage_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/model/request/set_mypage_address_notification_request.dart';
import '../../data/model/request/set_mypage_disaster_types_request.dart';
import '../../data/model/request/set_mypage_inquires_request.dart';
import '../../data/model/request/set_mypage_profiles_request.dart';
import '../../data/model/request/withdraw_user_request.dart';
import '../../data/model/response/basic_response.dart';
import '../../data/model/response/mypage/get_mypage_address_response.dart';
import '../../data/model/response/mypage/get_mypage_announcement_detail_response.dart';
import '../../data/model/response/mypage/get_mypage_announcements_list_response.dart';
import '../../data/model/response/mypage/get_mypage_articles_response.dart';
import '../../data/model/response/mypage/get_mypage_disaster_types_response.dart';
import '../../data/model/response/mypage/get_mypage_notification_setting_response.dart';
import '../../data/model/response/mypage/get_mypage_profiles_response.dart';
import '../../data/repositoryimpl/mypage_repository_impl.dart';

final myPageRepositoryProvider = Provider<MyPageRepository>((ref) {
  final http = ref.watch(dioProvider);
  return MyPageRepositoryImpl(service: MyPageService(http));
});



abstract class MyPageRepository {
  Future<BasicResponse> getLogOut();

  Future<GetMyPageProfilesResponse> getMyProfiles();

  Future<BasicResponse> setMyProfiles(SetMyPageProfilesRequest setMypageProfilesRequest);

  Future<BasicResponse> setNotificationSetting(String type);

  Future<BasicResponse> setDisasterTypes(SetMypageDisasterTypesRequest setMypageDisasterTypesRequest);

  Future<GetMyPageDisasterTypesResponse> getMyDisasterTypes();

  Future<GetMyPageAddressResponse> getMyAddress();

  Future<BasicResponse> setMyAddress(SetMypageAddressNotificationRequest setMypageAddressNotificationRequest);

  Future<GetMyPageNotificationSettingResponse> getMyNotificationSetting();

  Future<BasicResponse> setInquires(SetMyPageInquiresRequest setMypageInquiresRequest);

  Future<GetMyPageArticlesResponse> getMyArticles(int page, int size);

  Future<BasicResponse> withDrawUserInfo(String reason, WithDrawRequest withDrawRequest);

  Future<AnnouncementListResponse> getAnnouncements();

  Future<AnnouncementDetailResponse> getAnnouncementDetail(String id);
}