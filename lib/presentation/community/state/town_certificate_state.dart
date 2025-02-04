import 'package:freezed_annotation/freezed_annotation.dart';

part 'town_certificate_state.freezed.dart';

@freezed
sealed class TownCertificateState with _$TownCertificateState {
  factory TownCertificateState({
    //인증진행하려 고른 주소
    @Default('') String certificateAddress,
    //인증 여부
    @Default(false) bool isCertificate,
    //권한 허용 여부
    @Default(true) bool isPermissionGrant,
    //인증 성공 여부
    @Default(false) bool isSuccessCertificate,

    @Default(true) bool firstStep,
    @Default(false) bool secondStep,
    @Default(false) bool isDialogOpen,
    @Default(0.0) double latitude,
    @Default(0.0) double longitude,
    @Default('') String selectAddress,
  }) = _TownCertificateState;
}
