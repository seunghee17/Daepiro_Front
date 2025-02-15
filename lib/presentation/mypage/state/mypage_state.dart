import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/response/mypage/get_mypage_articles_response.dart';
part 'mypage_state.freezed.dart';

@freezed
sealed class MyPageState with _$MyPageState {
  factory MyPageState({
    @Default(true) isLoading,
    @Default('') profileImgUrl,
    @Default('') realName,
    @Default('') nickName,
    @Default(true) communityAlarmState,
    @Default(true) disasterAlarmState,
    @Default([]) List<String> disasterTypeList,
    @Default(['서비스 개선', '재난 알림 및 정보', '커뮤니티 이용', '기타']) List<String> inquireTypeList,
    @Default('') String inquireType,
    @Default(true) bool isArticleHasMore,
    @Default([]) List<UserArticle> myArticles,
    @Default(true) bool isArticleLoading,
}) = _MyPageState;
}