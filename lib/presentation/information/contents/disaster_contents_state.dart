import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/model/response/information/disaster_contents_list_response.dart';
part 'disaster_contents_state.freezed.dart';

@freezed
sealed class DisasterContentsState with _$DisasterContentsState {
  factory DisasterContentsState({
    @Default(false) bool isLoading,
    @Default([]) List<Contents> contentsList,    // 재난콘텐츠 목록

  }) = _DisasterContentsState;
}

