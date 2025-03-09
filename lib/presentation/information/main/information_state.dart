import 'package:daepiro/data/model/response/information/around_shelter_list_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/model/response/information/disaster_contents_list_response.dart';
part 'information_state.freezed.dart';

@freezed
sealed class InformationState with _$InformationState {
  factory InformationState({
    @Default(true) bool isLoadingContents,
    @Default(true) bool isLoadingShelters,
    @Default([]) List<Contents> contentsList,    // 메인 재난콘텐츠 목록
    @Default(0) int selectedAroundShelterType,
    @Default("") String myLocation,
    @Default([]) List<Shelters> shelterList,    // 주변 대피소 리스트
    @Default([]) List<Shelters> civilShelterList,    // 주변 대피소 리스트(민방위)
    @Default([]) List<Shelters> earthquakeShelterList,    // 주변 대피소 리스트(지진)
    @Default([]) List<Shelters> tsunamiShelterList,    // 주변 대피소 리스트(지진해일)
    @Default([]) List<Shelters> temperatureShelterList,    // 주변 대피소 리스트(쉼터)
    @Default(0) double latitude,
    @Default(0) double longitude,
  }) = _InformationState;
}

