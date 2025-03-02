import 'package:daepiro/data/model/response/sponsor/cheer_comment_response.dart';
import 'package:daepiro/data/model/response/sponsor/sponsor_list_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sponsor_state.freezed.dart';

@freezed
sealed class SponsorState with _$SponsorState {
  factory SponsorState({
    @Default(true) bool isLoading,
    @Default([]) List<Sponsor> sponsorList,    // 후원 리스트
    @Default([]) List<Comment> cheerCommentList,    // 응원 메세지 목록

    @Default([]) List<String> scrollCommentList1,    // 배너 응원메시지 1
    @Default([]) List<String> scrollCommentList2,    // 배너 응원메시지 2

    @Default('') String reportType,
    @Default(['허위사실 유포','욕설 및 비방','상업적 광고 및 판매','음란물 및 불건전한 내용','기타']) List<String> reportDescription
  }) = _SponsorState;
}

