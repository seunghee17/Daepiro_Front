import 'package:daepiro/data/model/response/home/popular_post_response.dart';
import 'package:daepiro/domain/usecase/home/get_behavior_tips_usecase.dart';
import 'package:daepiro/domain/usecase/home/get_notifications_usecase.dart';
import 'package:daepiro/domain/usecase/home/get_popular_post_usecase.dart';
import 'package:daepiro/domain/usecase/home/get_disasters_history_usecase.dart';
import 'package:daepiro/domain/usecase/home/get_recent_contents_usecase.dart';
import 'package:daepiro/domain/usecase/home/get_user_address_usecase.dart';
import 'package:daepiro/domain/usecase/home/home_disaster_feed_usecase.dart';
import 'package:daepiro/domain/usecase/home/home_disaster_history_usecase.dart';
import 'package:daepiro/domain/usecase/home/home_status_usecase.dart';
import 'package:daepiro/presentation/home/main/home_state.dart';
import 'package:daepiro/route/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../../../domain/usecase/home/get_around_shelter_list_usecase.dart';
import '../../../domain/usecase/home/register_user_location_usecase.dart';
import '../../../domain/usecase/mypage/mypage_get_profiles_usecase.dart';
import '../../../domain/usecase/sponsor/get_sponsor_list_usecase.dart';

final homeStateNotifierProvider = StateNotifierProvider<HomeViewModel, HomeState>((ref) {
  return HomeViewModel(ref);
});

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel(this.ref) : super(HomeState()) {
    final list = List.generate(5, (_) => <PopularPost>[]);  // 빈 리스트 5개 생성
    state = state.copyWith(allPopularPostList: list);

    getCurrentLocation();
  }

  final StateNotifierProviderRef<HomeViewModel, HomeState> ref;

  // 홈 화면에서 재난이 발생했는지 조회
  Future<void> getHomeStatus() async {
    try {
      final response = await ref.read(
          getHomeStatusUseCaseProvider(GetHomeStatusUseCase()).future
      );

      state = state.copyWith(
          isLoading: false,
          isOccurred: response.data?.isOccurred ?? false
      );

      if (response.code == 1000) {
        if (response.data!.isOccurred == true) {
          getHomeDisasterFeed();
          getHomeDisasterHistory();
        } else {
          loadNickname();
          getHomeDisasterHistory();
          getPopularPostList(category: "");
          getPopularPostList(category: "LIFE");
          getPopularPostList(category: "TRAFFIC");
          getPopularPostList(category: "SAFE");
          getPopularPostList(category: "OTHER");
          getDisasterContentsList();
          getSponsorList();
        }
      }
    } catch (error) {
      print('재난 발생상황 조회 에러: $error');
    }
  }

  Future<void> loadNickname() async {
    final response = await ref
        .read(getProfilesUseCaseProvider(GetMyPageProfileUseCase()).future);
    state = state.copyWith(nickname: response.data?.nickname ?? '');
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
        // 위치 권한 X

      }
    } else {
      // 시스템 위치 OFF

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

      if (type == "earthquake") {
        state = state.copyWith(
            earthquakeShelterList: response.data?.shelters ?? []
        );
        selectAroundShelterType(0);
      } else if (type == "tsunami") {
        state = state.copyWith(
            tsunamiShelterList: response.data?.shelters ?? []
        );
      } else if (type == "civil") {
        state = state.copyWith(
            civilShelterList: response.data?.shelters ?? []
        );
      }

      state = state.copyWith(
        shelterLocation: response.data?.myLocation ?? "",
      );
    } catch (error) {
      print('주변 대피소 조회 에러: $error');
    }
  }

  void selectAroundShelterType(int index) {
    if (index == 0) {
      state = state.copyWith(
          shelterList: state.earthquakeShelterList
      );
    } else if (index == 1) {
      state = state.copyWith(
          shelterList: state.tsunamiShelterList
      );
    } else if (index == 2) {
      state = state.copyWith(
          shelterList: state.civilShelterList
      );
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

      getHomeStatus();

      getAroundShelterList(type: "earthquake");
      getAroundShelterList(type: "tsunami");
      getAroundShelterList(type: "civil");

      getUserAddress();
    } catch (error) {
      print('사용자 위치 등록 에러: $error');
    }
  }

  // 사용자 주소 조회
  Future<void> getUserAddress() async {
    try {
      final response = await ref.read(
          getUserAddressUsecaseProvider(GetUserAddressUsecase()).future
      );

      state = state.copyWith(
        location: response.data?.currentPosition ?? ""
      );
    } catch (error) {
      print('사용자 주소 조회 에러: $error');
    }
  }

  void selectPopularPostCategory(int index) {
    state = state.copyWith(
      selectedPopularPostCategory: index,
      popularPostList: state.allPopularPostList[index]
    );
  }

  void selectContentsCategory(int index) {
    state = state.copyWith(
        selectedContentsCategory: index
    );
  }

  void selectDisasterHistoryType(int index) async {
    state = state.copyWith(
      selectedDisasterHistoryType: index,
    );
  }

  void selectCheckList(int selectedType, int index) async {
    state = state.copyWith(
      behaviorTip: state.behaviorTip?.copyWith(
        tips: state.behaviorTip?.tips?.map((tipList) {
          if (state.behaviorTip!.tips!.indexOf(tipList) == selectedType) {
            return tipList.copyWith(
              tips: tipList.tips?.asMap().entries.map((entry) {
                if (entry.key == index) {
                  return (entry.value.$1, !entry.value.$2); // bool 값 토글
                }
                return entry.value;
              }).toList(),
            );
          }
          return tipList;
        }).toList(),
      ),
    );
  }

  // 홈 화면 재난문자 내역 조회
  Future<void> getHomeDisasterHistory() async {
    try {
      final response = await ref.read(
          getHomeDisasterHistoryUseCaseProvider(GetHomeDisasterHistoryUseCase()).future
      );

      if (response.code == 1000) {
        state = state.copyWith(
            disasterHistoryList: response.data ?? [],
            isLoadingDisasterHistory: false
        );
      }
    } catch (error) {
      print('재난문자 내역 조회 에러: $error');
    }
  }

  // 홈 화면 동네생활 인기글 조회
  Future<void> getPopularPostList({
    required String category
  }) async {
    try {
      final response = await ref.read(
          getPopularPostUsecaseProvider((GetPopularPostUsecase(category: category))).future
      );

      if (response.code == 1000) {
        final list = List<List<PopularPost>>.from(state.allPopularPostList);
        if (category == "") {
          list[0] = response.data ?? [];
        } else if (category == "LIFE") {
          list[1] = response.data ?? [];
        } else if (category == "TRAFFIC") {
          list[2] = response.data ?? [];
        } else if (category == "SAFE") {
          list[3] = response.data ?? [];
        } else if (category == "OTHER") {
          list[4] = response.data ?? [];
        }

        state = state.copyWith(
          allPopularPostList: list,
          isLoadingPopularPost: state.isLoadingPopularPost+1
        );

        selectPopularPostCategory(0);
      }
    } catch (error) {
      print('동네생활 인기글 조회 에러: $error');
    }
  }

  // 재난콘텐츠 목록 조회
  Future<void> getDisasterContentsList() async {
    try {
      final response = await ref.read(
          getRecentContentsUsecaseProvider(GetRecentContentsUsecase()).future
      );

      state = state.copyWith(
          contentsList: response.data?.contents?.sublist(0, 10) ?? [],
          isLoadingContents: false
      );
    } catch (error) {
      print('재난콘텐츠 목록 조회 에러: $error');
    }
  }

  // 후원목록 조회
  Future<void> getSponsorList() async {
    try {
      final response = await ref.read(
          getSponsorListUsecaseProvider(GetSponsorListUsecase()).future
      );

      if (response.code == 1000) {
        state = state.copyWith(
            sponsorList: response.data ?? [],
            isLoadingSponsor: false
        );
      }
    } catch (error) {
      print('후원목록 조회 에러: $error');
    }
  }

  // 최근 재난문자 내역 조회
  Future<void> getDisastersHistory() async {
    try {
      final response = await ref.read(
          getRecentDisastersUsecaseProvider(GetDisastersHistoryUsecase()).future
      );

      if (response.code == 1000) {
        state = state.copyWith(
          disastersList: response.data ?? [],
          historyIsLoading: false
        );
      }
    } catch (error) {
      print('최근 재난문자 내역 조회 에러: $error');
    }
  }

  // 재난에 대한 행동요령 조회
  Future<void> getBehaviorTips(String disasterId) async {
    try {
      final response = await ref.read(
          getBehaviorTipsUsecaseProvider(GetBehaviorTipsUsecase(disasterId: disasterId)).future
      );

      if (response.code == 1000) {
        state = state.copyWith(
          behaviorTip: response.data,
        );
      }
    } catch (error) {
      print('최근 재난문자 내역 조회 에러: $error');
    }
  }

  // 알림 내역 조회
  Future<void> getNotifications() async {
    try {
      final response = await ref.read(
          getNotificationsUsecaseProvider(GetNotificationsUsecase()).future
      );

      if (response.code == 1000) {
        state = state.copyWith(
          notificationList: response.data ?? [],
        );
      }
    } catch (error) {
      print('알림 내역 조회 에러: $error');
    }
  }

  // 재난 발생했을 때 재난 상세내용 조회
  Future<void> getHomeDisasterFeed() async {
    try {
      final response = await ref.read(
          getHomeDisasterFeedUseCaseProvider(GetHomeDisasterFeedUseCase()).future
      );

      if (response.code == 1000) {
        state = state.copyWith(
            disasterInfo: response.data
        );

        final response2 = await ref.read(
            getBehaviorTipsUsecaseProvider(GetBehaviorTipsUsecase(disasterId: response.data!.disasterTypeId.toString())).future
        );

        if (response2.code == 1000) {
          state = state.copyWith(
            disasterBehaviorTip: response2.data
          );
        }
      }
    } catch (error) {
      print('재난발생 - 재난 상세내용 에러: $error');
    }
  }

  // 재난발생 시 체크리스트 업데이트
  void selectCheckListAtDisaster(int selectedType, int index) async {
    state = state.copyWith(
      disasterBehaviorTip: state.disasterBehaviorTip?.copyWith(
        tips: state.disasterBehaviorTip?.tips?.map((tipList) {
          if (state.disasterBehaviorTip!.tips!.indexOf(tipList) == selectedType) {
            return tipList.copyWith(
              tips: tipList.tips?.asMap().entries.map((entry) {
                if (entry.key == index) {
                  return (entry.value.$1, !entry.value.$2); // bool 값 토글
                }
                return entry.value;
              }).toList(),
            );
          }
          return tipList;
        }).toList(),
      ),
    );
  }

  Future<void> disposeDisasterDetail() async {
    state = state.copyWith(
      behaviorTip: null
    );
  }
}
