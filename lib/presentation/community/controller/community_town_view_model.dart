import 'package:daepiro/presentation/community/state/community_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final communityTownProvider =
StateNotifierProvider<CommunityTownViewModel, CommunityState>((ref) {
  return CommunityTownViewModel(ref);
});

class CommunityTownViewModel extends StateNotifier<CommunityState> {
  final Ref ref;

  CommunityTownViewModel(this.ref): super(CommunityState()) {
    _initState();
  }

  Future<void> _initState() async {

  }

  Future<void> selectButton(String type) async {
    state = state.copyWith(townCommunityType: type);
    if (type == 'ALL') {
      //데이터 로드하는 로직
    }
    if(type == 'LIFE') {

    }
    if(type == 'TRAFFIC') {

    }
    if(type == 'SAFE') {

    }
    if(type == 'OTHER') {

    }
  }
}