import 'dart:async';
import 'dart:io';
import 'package:daepiro/presentation/onboarding/state/permission_state.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

final permissionStateNotifierProvider =
    StateNotifierProvider<PermissionViewModel, PermissionState>((ref) {
  return PermissionViewModel(PermissionState());
});

class PermissionViewModel extends StateNotifier<PermissionState> {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //이미지 권한의 경우 버전별 분기처리 필요
  List<Permission> permission = [
    Permission.location,
    Permission.notification,
    Permission.camera,
  ];

  Future<List<Permission>> setVersionPermisson() async {
    if(Platform.isAndroid) {
      AndroidDeviceInfo info = await deviceInfo.androidInfo;
      if(info.version.sdkInt >= 33) {
        permission.add(Permission.photos);
      } else {
        permission.add(Permission.storage);
      }
    } else {
      permission.add(Permission.photos);
    }
    return permission;
  }

  PermissionViewModel(super.state);

  void updateAllAgreeState() {
    bool current = state.isAllPermissionGrant;
    List<bool> updateList = [false, false, false, false];
    for (int i = 0; i < 4; i++) {
      updateList[i] = !current;
    }
    state = state.copyWith(
      isAllPermissionGrant: !current,
      isPermissionCheckboxState: updateList,
    );
  }

  void updateEachPermissionState(int index) {
    var current = List<bool>.from(state.isPermissionCheckboxState);
    current[index] = !current[index];
    state = state.copyWith(isPermissionCheckboxState: current);
    bool allChecked = current.every((checked) => checked);
    state = state.copyWith(isAllPermissionGrant: allChecked);
  }

  Future<void> permissionRequest() async {
    for (int i = 0; i < 4; i++) {
      if (state.isPermissionCheckboxState[i]) {
        await setVersionPermisson();
        await permission[i].request();
      }
    }
  }
}