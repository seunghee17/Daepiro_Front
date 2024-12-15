import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/model/response/information/disaster_contents_response.dart';
part 'information_state.freezed.dart';

@freezed
sealed class InformationState with _$InformationState {
  factory InformationState({
    @Default(false) bool isLoading,
    @Default([]) List<Contents> contentsList,
    @Default(0) int selectedAroundShelterType,

  }) = _InformationState;
}

