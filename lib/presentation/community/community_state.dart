import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/request/album_model.dart';

part 'community_state.freezed.dart';

@freezed
sealed class CommunityState with _$CommunityState {
  factory CommunityState({
    //전체와 수신버튼 상태
    @Default(false) bool receiveButton,
    @Default(true) bool AllButton,
    //현재 보여지는 상태
    @Default(true) bool isDisasterScreen,
    @Default(false) bool isCertificateUser,
    @Default(false) bool isDeleteComplete,
    @Default(null) String? reportType,
    @Default([]) List<AlbumModel> albums,
    @Default(0) int currentAlbumIndex,
    @Default([]) List<AlbumModel> selectAlbums,
  }) = _CommunityState;
}
