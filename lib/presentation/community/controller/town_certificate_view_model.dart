import 'package:daepiro/presentation/community/state/town_certificate_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../data/model/request/set_town_certificate_request.dart';
import '../../../domain/usecase/community/town_get_certificate_usecase.dart';
import '../../../domain/usecase/community/town_set_certificate_usecase.dart';

final townCertificateProvider =
    StateNotifierProvider<TownCertificateViewModel, TownCertificateState>(
        (ref) {
  return TownCertificateViewModel(ref);
});

class TownCertificateViewModel extends StateNotifier<TownCertificateState> {
  final Ref ref;

  TownCertificateViewModel(this.ref) : super(TownCertificateState());

  Future<void> initState() async {
    await getLocationPermissionStatus();
  }

  Future<void> getLocationPermissionStatus() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      state = state.copyWith(isPermissionGrant: false);
    }
  }

  Future<void> getCertificateState() async {
    final result = await ref.read(
        townGetCertificateUseCaseProvider(TownGetCertificateUseCase()).future);
    state = state.copyWith(isCertificate: result.data![0].isVerified!);
  }

  Future<void> getUserLocation() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      state = state.copyWith(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    }
    return;
  }

  void setUserLatitude(double latitude, double longitude) {
    state = state.copyWith(
      latitude: latitude,
      longitude: longitude,
    );
  }

  Future<void> setCertificate(List<String> townLongAddressList) async {
    await getUserLocation();
    var certificateAddress = '';
    for(String address in townLongAddressList) {
      if(address.contains(state.selectAddress)) {
        certificateAddress = address;
      }
    }
    final request = SetTownCertificateRequest(
      longitude: state.longitude,
      latitude: state.latitude,
      address: certificateAddress,
    );
    final result = await ref.read(townSetCertificateUseCaseProvider(
      TownSetCertificateUseCase(
        setTownCertificateRequest: request,
      ),
    ).future);
    if (result.code == 1000) {
      state = state.copyWith(isSuccessCertificate: true);
    } else {
      state = state.copyWith(isSuccessCertificate: false);
    }
  }

  void selectCertificateTown(String address) {
    state = state.copyWith(certificateAddress: address);
  }

  void setFirstStep(bool value) {
    state = state.copyWith(firstStep: value);
  }

  void setSecondStep(bool value) {
    state = state.copyWith(secondStep: value);
  }

  void setSelectAddress(String value) {
    state = state.copyWith(selectAddress: value);
  }

  void clearState() {
    state = state.copyWith(
      certificateAddress: '',
        isCertificate: false,
        isPermissionGrant: true,
        isSuccessCertificate: false,
        firstStep: true,
        secondStep: false,
        isDialogOpen: false,
        latitude: 0.0,
        longitude: 0.0,
        selectAddress: ''
    );
  }
}
