import 'package:daepiro/presentation/community/community_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'community_view_model.g.dart';

@riverpod
class CommunityViewModel extends _$CommunityViewModel {
  FutureOr<CommunityState> build() async {
    return CommunityState();
  }

  void clickReceiveButton() {
    bool current = state.value!.receiveButton;
    state = state.whenData((value) => value.copyWith(receiveButton: !current));
  }

  void clickAllButton() {
    bool current = state.value!.AllButton;
    state = state.whenData((value) => value.copyWith(AllButton: !current));
  }
}