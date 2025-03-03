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

  void selectCheckList(String name, String filter, String tipText) {
    if (state.emergencyBehaviorList.map((e) => e.name ).contains(name)) {
      state = state.copyWith(
        emergencyBehaviorList: List.from(state.emergencyBehaviorList.map((behavior) {
          if (behavior.name == name) {
            return behavior.copyWith(
              tips: behavior.tips?.map((tip) {
                if (tip.filter == filter) {
                  return tip.copyWith(
                    tips: tip.tips?.map((entry) {
                      if (entry.$1 == tipText) {
                        return (entry.$1, !entry.$2);
                      }
                      return (entry.$1, entry.$2);
                    }).toList(),
                  );
                }
                return tip.copyWith(
                  tips: List.from(tip.tips ?? []),
                );
              }).toList(),
            );
          }
          return behavior.copyWith(
            tips: behavior.tips?.map(
                  (tip) => tip.copyWith(tips: List.from(tip.tips ?? [])),
            ).toList(),
          );
        })),
      );
    } else {
      state = state.copyWith(
        commonBehaviorList: List.from(state.commonBehaviorList.map((behavior) {
          if (behavior.name == name) {
            return behavior.copyWith(
              tips: behavior.tips?.map((tip) {
                if (tip.filter == filter) {
                  return tip.copyWith(
                    tips: tip.tips?.map((entry) {
                      if (entry.$1 == tipText) {
                        return (entry.$1, !entry.$2);
                      }
                      return (entry.$1, entry.$2);
                    }).toList(),
                  );
                }
                return tip.copyWith(
                  tips: List.from(tip.tips ?? []),
                );
              }).toList(),
            );
          }
          return behavior.copyWith(
            tips: behavior.tips?.map(
                  (tip) => tip.copyWith(tips: List.from(tip.tips ?? [])),
            ).toList(),
          );
        })),
      );
    }
  }

  void onDispose(String name) {
    if (state.emergencyBehaviorList.map((e) => e.name ).contains(name)) {
      state = state.copyWith(
        emergencyBehaviorList: List.from(state.emergencyBehaviorList.map((behavior) {
          if (behavior.name == name) {
            return behavior.copyWith(
              tips: behavior.tips?.map((tip) {
                return tip.copyWith(
                  tips: tip.tips?.map((entry) {
                    return (entry.$1, false); // bool 값을 false로 변경
                  }).toList(),
                );
              }).toList(),
            );
          }
          return behavior; // 일치하지 않는 behavior는 그대로 반환
        }).toList()),
      );
    } else {
      state = state.copyWith(
        commonBehaviorList: List.from(state.commonBehaviorList.map((behavior) {
          if (behavior.name == name) {
            return behavior.copyWith(
              tips: behavior.tips?.map((tip) {
                return tip.copyWith(
                  tips: tip.tips?.map((entry) {
                    return (entry.$1, false); // bool 값을 false로 변경
                  }).toList(),
                );
              }).toList(),
            );
          }
          return behavior; // 일치하지 않는 behavior는 그대로 반환
        }).toList()),
      );
    }
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
