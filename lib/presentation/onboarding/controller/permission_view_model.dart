import 'dart:io';

import 'package:daepiro/presentation/onboarding/state/permission_state.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'permission_view_model.g.dart';

@riverpod
class PermissionViewModel extends _$PermissionViewModel {
  //이미지 권한의 경우 버전별 분기처리 필요
  List<Permission> permission = [
    Permission.location,
    Permission.notification,
    Permission.camera,
    Permission.photos
  ];

  @override
  FutureOr<PermissionState> build() async {
    return PermissionState();
  }

  void updateAllAgreeState() {
    bool current = state.value!.isAllPermissionGrant;
    List<bool> updateList = [false,false,false,false];
    for(int i=0; i<4; i++) {
      updateList[i] = !current;
    }
    state =  state.whenData((value) => value.copyWith(
        isAllPermissionGrant: !current,
        isPermissionCheckboxState: updateList
    ));
  }

  void updateEachPermissionState(int index) {
    var current = List<bool>.from(state.value!.isPermissionCheckboxState);
    current[index] = !current[index];
    state =  state.whenData((value) => value.copyWith(
        isPermissionCheckboxState: current
    ));
    bool allChecked = current.every((checked) => checked);
    state =  state.whenData((value) => value.copyWith(
        isAllPermissionGrant: allChecked
    ));
  }

  Future<void> permissionRequest() async {
    for(int i=0; i<4; i++) {
      if(state.value!.isPermissionCheckboxState[i]) {
        await permission[i].request();
      }
    }
  }
}