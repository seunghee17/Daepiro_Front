import 'package:daepiro/data/model/response/information/around_shelter_list_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/model/response/information/disaster_contents_response.dart';
part 'information_state.freezed.dart';

@freezed
sealed class InformationState with _$InformationState {
  factory InformationState({
    @Default(false) bool isLoading,
    @Default([]) List<Contents> contentsList,    // 메인 재난콘텐츠 목록
    @Default(0) int selectedAroundShelterType,
    @Default([]) List<Shelters> shelterList,    // 주변 대피소 리스트
  }) = _InformationState;
}

