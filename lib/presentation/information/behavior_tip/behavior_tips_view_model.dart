import 'package:daepiro/domain/usecase/information/get_behavior_list_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'behavior_tips_state.dart';

final behaviorTipsStateNotifierProvider = StateNotifierProvider<BehaviorTipsViewModel, BehaviorTipsState>((ref) {
  return BehaviorTipsViewModel(ref);
});

class BehaviorTipsViewModel extends StateNotifier<BehaviorTipsState> {
  final StateNotifierProviderRef<BehaviorTipsViewModel, BehaviorTipsState> ref;

  BehaviorTipsViewModel(this.ref) : super(BehaviorTipsState()) {
    getBehaviorList(type: "emergency");
    getBehaviorList(type: "common");

  }

  // void selectCheckList(int selectedType, int index) async {
  //   state = state.copyWith(
  //     behaviorTip: state.behaviorTip?.copyWith(
  //       tips: state.behaviorTip?.tips?.map((tipList) {
  //         if (state.behaviorTip!.tips!.indexOf(tipList) == selectedType) {
  //           return tipList.copyWith(
  //             tips: tipList.tips?.asMap().entries.map((entry) {
  //               if (entry.key == index) {
  //                 return (entry.value.$1, !entry.value.$2); // bool 값 토글
  //               }
  //               return entry.value;
  //             }).toList(),
  //           );
  //         }
  //         return tipList;
  //       }).toList(),
  //     ),
  //   );
  // }

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
