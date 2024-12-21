import 'dart:math';

import 'package:daepiro/domain/usecase/information/get_around_shelter_list_usecase.dart';
import 'package:daepiro/domain/usecase/information/get_disaster_contents_list_usecase.dart';
import 'package:daepiro/domain/usecase/information/get_disaster_contents_usecase.dart';
import 'package:daepiro/domain/usecase/information/register_user_location_usecase.dart';
import 'package:daepiro/presentation/information/main/information_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:logger/logger.dart';

final informationStateNotifierProvider = StateNotifierProvider<InformationViewModel, InformationState>((ref) {
  return InformationViewModel(ref);
});

class InformationViewModel extends StateNotifier<InformationState> {
  InformationViewModel(this.ref) : super(InformationState()) {
    getDisasterContents();

    getCurrentLocation();
  }

  final StateNotifierProviderRef<InformationViewModel, InformationState> ref;

  void selectAroundShelterType(int index) {
    state = state.copyWith(selectedAroundShelterType: index);
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

      state = state.copyWith(
          shelterList: response.data?.shelters ?? []
      );

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


    } catch (error) {
      print('사용자 위치 등록 에러: $error');
    }
  }

}
