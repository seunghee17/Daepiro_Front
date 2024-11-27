import 'package:daepiro/presentation/community/community_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final communityNotifierProvider = StateNotifierProvider<CommunityViewModel, CommunityState>((ref) {
  return CommunityViewModel(CommunityState());
});

class CommunityViewModel extends StateNotifier<CommunityState> {
  CommunityViewModel(super.state);

  void clickReceiveButton() {
    bool current = state.receiveButton;
    state = state.copyWith(receiveButton: current);
  }

  void clickAllButton() {
    bool current = state.AllButton;
    state = state.copyWith(AllButton: !current, receiveButton: current);
  }

  void changeScreenState(bool isdisasterScreen) {
    state = state.copyWith(isDisasterScreen : isdisasterScreen);
  }
}