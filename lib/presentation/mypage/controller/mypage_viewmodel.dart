import 'package:daepiro/data/model/request/set_mypage_disaster_types_request.dart';
import 'package:daepiro/data/model/request/set_mypage_inquires_request.dart';
import 'package:daepiro/data/model/request/set_mypage_profiles_request.dart';
import 'package:daepiro/domain/usecase/community/community_article_like_usecase.dart';
import 'package:daepiro/domain/usecase/mypage/mypage_get_myarticles_usecase.dart';
import 'package:daepiro/domain/usecase/mypage/mypage_set_profiles_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecase/mypage/mypage_get_address_usecase.dart';
import '../../../domain/usecase/mypage/mypage_get_alarm_setting_usecase.dart';
import '../../../domain/usecase/mypage/mypage_get_disaster_type_usecase.dart';
import '../../../domain/usecase/mypage/mypage_get_profiles_usecase.dart';
import '../../../domain/usecase/mypage/mypage_set_alarm_setting_usecase.dart';
import '../../../domain/usecase/mypage/mypage_set_disaster_type_usecase.dart';
import '../../../domain/usecase/mypage/mypage_set_inquires_usecase.dart';
import '../state/mypage_state.dart';

final myPageProvider =
    StateNotifierProvider<MyPageViewModel, MyPageState>((ref) {
  return MyPageViewModel(ref);
});

class MyPageViewModel extends StateNotifier<MyPageState> {
  final Ref ref;
  var _currentPage = 0;

  MyPageViewModel(this.ref) : super(MyPageState()) {
    getMyProfiles();
    getDisasterType();
    getAddressList();
    getAlarmSettingType();
  }

  Future<void> getMyProfiles() async {
    final response = await ref
        .read(getProfilesUseCaseProvider(GetMyPageProfileUseCase()).future);
    state = state.copyWith(
        profileImgUrl: response.data?.profileImgUrl ?? '',
        realName: response.data?.realname ?? '',
        nickName: response.data?.nickname ?? '');
  }

  Future<void> getDisasterType() async {
    final response = await ref
        .read(getDisasterTypeUseCaseProvider(GetDisasterTypeUseCase()).future);
    state =
        state.copyWith(disasterTypeList: response.data?.disasterTypes ?? []);
  }

  //TODO api 완성후 수정
  Future<void> getAddressList() async {
    final response =
        await ref.read(getAddressUseCaseProvider(GetAddressUseCase()).future);
    state = state.copyWith();
  }

  Future<void> getAlarmSettingType() async {
    final response = await ref
        .read(getAlarmSettingUseCaseProvider(GetAlarmSettingUseCase()).future);
    state = state.copyWith(
        communityAlarmState:
            response.data?.isCommunityNotificationEnabled ?? false,
        disasterAlarmState:
            response.data?.isDisasterNotificationEnabled ?? false);
  }

  Future<void> setMyProfiles(String realName, String nickName) async {
    await ref.read(setProfilesUseCaseProvider(SetMyPageProfileUseCase(
        setMypageProfilesRequest: SetMyPageProfilesRequest(
      realname: realName,
      nickname: nickName,
    ))).future);
  }

  Future<void> setNotificationType(String type) async {
    await ref.read(
        setAlarmSettingUseCaseProvider(SetAlarmSettingUseCase(type: type))
            .future);
    if (type == 'community') {
      state = state.copyWith(communityAlarmState: !state.communityAlarmState);
    } else {
      state = state.copyWith(disasterAlarmState: !state.disasterAlarmState);
    }
  }

  //재난 리스트 아이템 추가
  void addDisasterType(String disasterType) {
    final mutableList = List<String>.from(state.disasterTypeList);
    mutableList.add(disasterType);
    state = state.copyWith(disasterTypeList: List.unmodifiable(mutableList));
  }

  void removeDisasterType(String disasterType) {
    final mutableList = List<String>.from(state.disasterTypeList);
    mutableList.remove(disasterType);
    state = state.copyWith(disasterTypeList: List.unmodifiable(mutableList));
  }

  Future<bool> setDisasterType() async {
    try {
      final result = await ref.read(setDisasterTypeUseCaseProvider(
              SetDisasterTypeUseCase(
                  setMypageDisasterTypesRequest: SetMypageDisasterTypesRequest(
                      disasterTypes: state.disasterTypeList)))
          .future);
      if (result.code != 1000) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  void setInquireType(String type) {
    state = state.copyWith(inquireType: type);
  }

  Future<void> setInquires(String content, String email) async {
    await ref.read(setInquiresUseCaseProvider(SetInquiresUseCase(
            setMyPageInquiresRequest: SetMyPageInquiresRequest(
                type: InquireCategory.getNamedByCategory(state.inquireType),
                content: content,
                email: email)))
        .future);
    state = state.copyWith(inquireType: '');
  }

  Future<void> getMyArticles() async {
    if (!state.isArticleHasMore) return;
    state = state.copyWith(isArticleLoading: true);
    final newPage = _currentPage + 1;
    final currentList = state.myArticles;
    try {
      final result = await ref.read(getMyArticlesUseCaseProvider(
              GetMyArticlesUseCase(page: newPage, size: 10))
          .future);
      final lastContent = result.data?.empty ?? false;
      if (lastContent) {
        state = state.copyWith(
          isArticleHasMore: false,
          isArticleLoading: false,
        );
        return;
      }
      final newContent = result.data?.content ?? [];
      _currentPage = newPage;
      state = state.copyWith(
        myArticles: List.from(currentList)..addAll(newContent),
        isArticleHasMore: true,
      );
    } catch (e) {
      print('마이페이지 내가쓴글 에러 발생 $e');
    } finally {
      state = state.copyWith(isArticleLoading: false);
    }
  }

  void initMyArticleState() async {
    _currentPage = 0;
    state = state.copyWith(
      myArticles: [],
      isArticleHasMore: true,
      isArticleLoading: true
    );
  }
}

enum InquireCategory {
  SERVICE('서비스 개선'),
  DISASTER('재난 알림 및 정보'),
  COMMUNITY('커뮤니티 이용'),
  ETC('기타');

  final String value;

  const InquireCategory(this.value);

  String getCategory() {
    switch (this) {
      case InquireCategory.SERVICE:
        return '서비스 개선';
      case InquireCategory.DISASTER:
        return '재난 알림 및 정보';
      case InquireCategory.COMMUNITY:
        return '커뮤니티 이용';
      default:
        return '기타';
    }
  }

  static String getByValue(String value) {
    return InquireCategory.values
        .firstWhere((el) => el.value == value)
        .getCategory();
  }

  static String getNamedByCategory(String category) {
    return InquireCategory.values
        .firstWhere((el) => el.getCategory() == category)
        .name;
  }
}
