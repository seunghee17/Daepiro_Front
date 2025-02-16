import 'package:daepiro/data/model/response/home/popular_post_response.dart';
import 'package:daepiro/domain/usecase/home/get_behavior_tips_usecase.dart';
import 'package:daepiro/domain/usecase/home/get_popular_post_usecase.dart';
import 'package:daepiro/domain/usecase/home/get_disasters_history_usecase.dart';
import 'package:daepiro/domain/usecase/home/get_recent_contents_usecase.dart';
import 'package:daepiro/domain/usecase/home/home_disaster_feed_usecase.dart';
import 'package:daepiro/domain/usecase/home/home_disaster_history_usecase.dart';
import 'package:daepiro/domain/usecase/home/home_status_usecase.dart';
import 'package:daepiro/presentation/home/main/home_state.dart';
import 'package:daepiro/route/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../../../domain/usecase/sponsor/get_sponsor_list_usecase.dart';

final homeStateNotifierProvider = StateNotifierProvider<HomeViewModel, HomeState>((ref) {
  return HomeViewModel(ref);
});

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel(this.ref) : super(HomeState()) {
    final list = List.generate(5, (_) => <PopularPost>[]);  // 빈 리스트 5개 생성
    state = state.copyWith(allPopularPostList: list);

    loadNickname();
    getAddress();
    getHomeStatus();
    getHomeDisasterHistory();
    getPopularPostList(category: "");
    getPopularPostList(category: "LIFE");
    getPopularPostList(category: "TRAFFIC");
    getPopularPostList(category: "SAFE");
    getPopularPostList(category: "OTHER");
    getDisasterContentsList();
    getSponsorList();
  }

  final StateNotifierProviderRef<HomeViewModel, HomeState> ref;

  Future<void> loadNickname() async {
    var nickname = await storage.read(key: 'nickname') ?? 'Empty닉네임';
    state = state.copyWith(
        nickname: nickname
    );
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

  // 홈 화면에서 재난이 발생했는지 조회
  Future<void> getHomeStatus() async {
    state = state.copyWith(isLoading: true);
    try {
      final response = await ref.read(
          getHomeStatusUseCaseProvider(GetHomeStatusUseCase()).future
      );

      state = state.copyWith(
          isLoading: false,
          isOccurred: response.data?.isOccurred ?? false
      );

      if (response.data?.isOccurred == true) {
        getHomeDisasterFeed();
      } else {

      }
    } catch (error) {
      print('재난 발생상황 에러: $error');
      state = state.copyWith(isLoading: false);
    }
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
          contentsList: response.data?.contents ?? [],
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

  // 재난 발생했을 때 재난 상세내용 조회
  Future<void> getHomeDisasterFeed() async {
    try {
      final response = await ref.read(
          getHomeDisasterFeedUseCaseProvider(GetHomeDisasterFeedUseCase()).future
      );



    } catch (error) {
      print('재난문자 내역 조회 에러: $error');
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> getAddress() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      print("결과 ${placemarks.toString()}");
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;

        // 3. 주소에서 "구"와 "동"만 추출
        String district = place.administrativeArea ?? ""; // "강남구"
        String district2 = place.subLocality ?? ""; // "강남구"
        String neighborhood = place.locality!.isEmpty ? place.subLocality ?? "" : ""; // "역삼동"

        state = state.copyWith(
          location: "$district $district2"
        );
      } else {
        state = state.copyWith(
            location: "주소 확인 불가"
        );
      }
    } catch (e) {
      print("홈 현위치 조회 오류 $e");
    }
  }


}
