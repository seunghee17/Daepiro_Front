import 'package:daepiro/domain/usecase/information/get_behavior_list_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'behavior_tips_state.dart';

final behaviorTipsStateNotifierProvider = StateNotifierProvider<BehaviorTipsViewModel, BehaviorTipsState>((ref) {
  print("taag1 호출");
  return BehaviorTipsViewModel(ref);
});

class BehaviorTipsViewModel extends StateNotifier<BehaviorTipsState> {
  final StateNotifierProviderRef<BehaviorTipsViewModel, BehaviorTipsState> ref;

  BehaviorTipsViewModel(this.ref) : super(BehaviorTipsState()) {
    getBehaviorList(type: "emergency");
    getBehaviorList(type: "common");

  }

  // 행동요령 목록 조회
  Future<void> getBehaviorList({
    required String type
  }) async {
    state = state.copyWith(isLoading: true);
    try {
      final response = await ref.read(
          getBehaviorListUsecaseProvider(GetBehaviorListUsecase(type: type)).future
      );

      if (type == "emergency") {
        state = state.copyWith(
            emergencyBehaviorList: response.data ?? []
        );
      } else {
        state = state.copyWith(
            commonBehaviorList: response.data ?? []
        );
      }

    } catch (error) {
      print('행동요령 목록 조회 에러: $error');
      state = state.copyWith(isLoading: false);
    }
  }

}
