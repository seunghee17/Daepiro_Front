import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/model/response/mypage/get_mypage_announcement_detail_response.dart';
import '../../../data/model/response/mypage/get_mypage_announcements_list_response.dart';
import '../../../data/model/response/mypage/get_mypage_articles_response.dart';
part 'mypage_state.freezed.dart';

@freezed
sealed class MyPageState with _$MyPageState {
  factory MyPageState({
    @Default(true) isLoading,

    /// 사용자 정보 수정
    @Default('') profileImgUrl,
    @Default('') nickName,
    @Default('') String nicknameState,
    @Default(false) bool completeSetNickName,

    @Default(false) communityAlarmState,
    @Default(false) disasterAlarmState,
    @Default([]) List<String> disasterTypeList,
    @Default(['서비스 개선', '재난 알림 및 정보', '커뮤니티 이용', '기타']) List<String> inquireTypeList,
    @Default('') String inquireType,
    @Default(true) bool isArticleHasMore,
    @Default([]) List<UserArticle> myArticles,
    @Default(true) bool isArticleLoading,

    /// 재난 지역 설정에 대한 상태값
    //입력한 주소값
    @Default('') String homeJuso,
    @Default('') String firstJuso,
    @Default('') String secondJuso,
    //입력한 주소 별명
    @Default('집') String homeJusoNick,
    @Default('') String firstJusoNick,
    @Default('') String secondJusoNick,

    //주소 별명 입력 오류 상태
    @Default('*별명 설정은 필수입니다.') String firstJusoState,
    @Default('*별명 설정은 필수입니다.') String secondJusoState,

    //주소 입력 텍스트 필드 visible 상태
    @Default(false) bool isJuso1Visible,
    @Default(false) bool isJuso2Visible,

    //주소 검색 오류 상태
    @Default(false) bool isError,

    //공지사항
    @Default([]) List<Announcements> announcementList,
    @Default(null) AnnouncementDetailResponse? announcementDetailResponse,

    //탈퇴 이유
    @Default(['새 계정을 만들고 싶어요.', '알림이 너무 자주 와요.', '정보가 부족해요.', '불쾌한 사람을 만났어요.', '기타']) List<String> leaveTypeList,
    @Default('') String leaveType,
}) = _MyPageState;
}