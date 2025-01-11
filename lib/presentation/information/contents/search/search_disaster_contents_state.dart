import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../data/model/response/information/disaster_contents_list_response.dart';
part 'search_disaster_contents_state.freezed.dart';

@freezed
sealed class SearchDisasterContentsState with _$SearchDisasterContentsState {
  factory SearchDisasterContentsState({
    @Default(false) bool isLoading,
    @Default([]) List<Contents> searchedContentsList,    // 재난콘텐츠 목록

  }) = _SearchDisasterContentsState;
}

