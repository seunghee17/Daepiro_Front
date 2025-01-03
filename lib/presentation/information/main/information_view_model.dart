import 'package:daepiro/domain/usecase/information/get_around_shelter_list_usecase.dart';
import 'package:daepiro/domain/usecase/information/get_disaster_contents_usecase.dart';
import 'package:daepiro/domain/usecase/information/register_user_location_usecase.dart';
import 'package:daepiro/presentation/information/main/information_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

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
          shelterList: state.temperatureShelterList
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
          shelterList: state.civilShelterList
      );
    }
  }

  Future<void> getCurrentLocation() async {
    bool isEnableLocation = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission;

    if (isEnableLocation) {
      permission = await Geolocator.checkPermission();
      if (permission != LocationPermission.denied ||
          permission != LocationPermission.deniedForever) {
        Position location = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        registerUserLocation(
            latitude: location.latitude.toString(),
            longitude: location.longitude.toString()
        );

        state = state.copyWith(
            latitude: location.latitude,
            longitude: location.longitude
        );
      } else {
        // 위치 비활성화

      }
    }
  }

  // 재난콘텐츠 조회
  Future<void> getDisasterContents() async {
    try {
      final response = await ref.read(
          getDisasterContentsUseCaseProvider(GetDisasterContentsUseCase()).future
      );

      state = state.copyWith(
        contentsList: response.data?.contents ?? []
      );

    } catch (error) {
      print('재난콘텐츠 조회 에러: $error');
      state = state.copyWith(isLoading: false);
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

      if (type == "temperature") {
        state = state.copyWith(
            temperatureShelterList: response.data?.shelters ?? []
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
      } else if (type == "civil") {
        state = state.copyWith(
            civilShelterList: response.data?.shelters ?? []
        );
      }

    } catch (error) {
      print('주변 대피소 조회 에러: $error');
    }
  }

  // 사용자 위치 등록
  Future<void> registerUserLocation({
    required String latitude,
    required String longitude,
  }) async {
    try {
      await ref.read(
          registerUserLocationUsecaseProvider(RegisterUserLocationUsecase(
              latitude: latitude,
              longitude: longitude
          )).future
      );

      getAroundShelterList(type: "temperature");
      getAroundShelterList(type: "earthquake");
      getAroundShelterList(type: "tsunami");
      getAroundShelterList(type: "civil");

    } catch (error) {
      print('사용자 위치 등록 에러: $error');
    }
  }

}
