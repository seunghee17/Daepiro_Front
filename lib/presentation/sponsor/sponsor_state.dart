import 'package:daepiro/data/model/response/sponsor/cheer_comment_response.dart';
import 'package:daepiro/data/model/response/sponsor/sponsor_list_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sponsor_state.freezed.dart';

@freezed
sealed class SponsorState with _$SponsorState {
  factory SponsorState({
    @Default(false) bool isLoading,
    @Default([]) List<Sponsor> sponsorList,    // 후원 리스트
    @Default([]) List<Comment> cheerCommentList,    // 응원 메세지 목록


  }) = _SponsorState;
}

