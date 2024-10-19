import 'package:daepiro/presentation/community/community_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'community_view_model.g.dart';

@riverpod
class CommunityViewModel extends _$CommunityViewModel {
  FutureOr<CommunityState> build() async {
    return CommunityState();
  }
}