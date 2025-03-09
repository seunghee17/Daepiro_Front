import 'package:daepiro/domain/usecase/information/get_disaster_contents_list_usecase.dart';
import 'package:daepiro/domain/usecase/home/register_user_location_usecase.dart';
import 'package:daepiro/presentation/information/main/information_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import '../../../domain/usecase/home/get_around_shelter_list_usecase.dart';

final informationStateNotifierProvider = StateNotifierProvider<InformationViewModel, InformationState>((ref) {
  return InformationViewModel(ref);
});

class InformationViewModel extends StateNotifier<InformationState> {
  final StateNotifierProviderRef<InformationViewModel, InformationState> ref;

  InformationViewModel(this.ref) : super(InformationState()) {
    getDisasterContents();
    getCurrentLocation();
  }

  void selectAroundShelterType(int index) {
    state = state.copyWith(selectedAroundShelterType: index);

    if (index == 0) {
      state = state.copyWith(
          shelterList: state.civilShelterList
      );
    } else if (index == 1) {
      state = state.copyWith(
          shelterList: state.earthquakeShelterList
      );
    } else if (index == 2) {
      state = state.copyWith(
          shelterList: state.tsunamiShelterList
      );
    } else if (index == 3) {
      state = state.copyWith(
          shelterList: state.temperatureShelterList
      );
    }
  }

  Future<void> getCurrentLocation() async {
    bool isEnableLocation = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission;

    if (isEnableLocation) {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
        Position location = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

        getAroundShelterList(type: "civil");
        getAroundShelterList(type: "earthquake");
        getAroundShelterList(type: "tsunami");
        getAroundShelterList(type: "temperature");

        state = state.copyWith(
            latitude: location.latitude,
            longitude: location.longitude
        );
      } else {
        // 위치 권한 X
        state = state.copyWith(
            isLoadingShelters: false
        );
      }
    } else {
      // 시스템 위치 X
      state = state.copyWith(
          isLoadingShelters: false
      );
    }
  }

  // 재난콘텐츠 목록 조회
  Future<void> getDisasterContents({
    String sortType = "latest",
    String size = "7"
  }) async {
    try {
      final response = await ref.read(
          getDisasterContentsListUseCaseProvider(GetDisasterContentsListUseCase(
            sortType: sortType,
            size: size,
            cursor: ""
          )).future
      );

      state = state.copyWith(
        contentsList: response.data?.contents?.sublist(0, 3) ?? [],
        isLoadingContents: false
      );

    } catch (error) {
      print('재난콘텐츠 목록 조회 에러: $error');
    }
  }

  // 주변 대피소 조회
  Future<void> getAroundShelterList({
    required String type
  }) async {
    try {
      final response = await ref.read(
          getAroundShelterListUsecaseProvider(GetAroundShelterListUsecase(
              type: type
          )).future
      );

      if (type == "civil") {
        state = state.copyWith(
            civilShelterList: response.data?.shelters ?? []
        );
        selectAroundShelterType(0);
      } else if (type == "earthquake") {
        state = state.copyWith(
            earthquakeShelterList: response.data?.shelters ?? []
        );
      } else if (type == "tsunami") {
        state = state.copyWith(
            tsunamiShelterList: response.data?.shelters ?? []
        );
      } else if (type == "temperature") {
        state = state.copyWith(
            temperatureShelterList: response.data?.shelters ?? []
        );
      }

      state = state.copyWith(
        myLocation: response.data?.myLocation ?? "",
        isLoadingShelters: false
      );

    } catch (error) {
      print('주변 대피소 조회 에러: $error');
    }
  }

}
