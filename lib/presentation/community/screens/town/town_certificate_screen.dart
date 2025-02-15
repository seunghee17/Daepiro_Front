import 'dart:async';
import 'dart:ui';
import 'package:daepiro/cmm/button/primary_filled_button.dart';
import 'package:daepiro/presentation/community/controller/community_town_view_model.dart';
import 'package:daepiro/presentation/community/controller/town_certificate_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_balloon/speech_balloon.dart';
import '../../../../cmm/DaepiroTheme.dart';
import '../../../../cmm/button/secondary_filled_button.dart';

class TownCertificateScreen extends ConsumerWidget {
  String selectAddress = '';
  bool isFirstDialogAppear = false;
  bool isSecondDialogAppear = false;
  NMarker? currentMarker;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(townCertificateProvider);
    final townState = ref.watch(communityTownProvider);
    bool isMapAppear =
        state.isPermissionGrant && !state.firstStep && !state.secondStep;

    ref.read(townCertificateProvider.notifier).getLocationPermissionStatus();
    final Completer<NaverMapController> mapControllerCompleter = Completer();

    if (state.firstStep && !isFirstDialogAppear) {
      isFirstDialogAppear = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        certificateNeedDialog(context, ref);
      });
    }
    if (state.secondStep == true && !isSecondDialogAppear) {
      isSecondDialogAppear = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        selectCertificateAddressDialog(
            context, townState.townList, ref, state.isPermissionGrant);
      });
    }

    if (isMapAppear) {
      //ref.read(townCertificateProvider.notifier).setCertificate(townState.townLongAddressList, selectAddress);
    }

    return Scaffold(
      body: SafeArea(
          child: isMapAppear
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      headerWidget(context),
                      addressWidget(state.selectAddress),
                      Container(
                        width: double.infinity,
                        height: 317,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                                right: 0,
                                left: 0,
                                child: Container(
                                  width: double.infinity,
                                  height: 317,
                                  child: NaverMap(
                                    options: NaverMapViewOptions(
                                        initialCameraPosition: NCameraPosition(
                                            target: NLatLng(state.latitude, state.longitude),
                                            zoom: 15.0),
                                        indoorEnable: true,
                                        logoClickEnable: false
                                    ),
                                    onMapReady: (controller) async {
                                      currentMarker = NMarker(
                                          id: 'daepiro',
                                          icon: NOverlayImage.fromAssetImage(
                                              'assets/icons/icon_location_58.png'),
                                          position:
                                          NLatLng(state.latitude, state.longitude));
                                      controller.addOverlay(currentMarker
                                      as NAddableOverlay<NOverlay<void>>);
                                      mapControllerCompleter.complete(controller);
                                    },
                                  ),
                                ),
                            ),
                            Positioned(
                              bottom: 12,
                              right: 12,
                              child: Visibility(
                                visible: !state.isSuccessCertificate,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: DaepiroColorStyle.white,
                                          boxShadow: [BoxShadow(
                                              color: Colors.black.withOpacity(0.12),
                                              blurRadius: 4.0,
                                              spreadRadius: 0.0,
                                              offset: const Offset(0, 0)
                                          )]
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SvgPicture.asset(
                                            width: 24,
                                            height: 24,
                                            'assets/icons/icon_reset.svg',
                                            colorFilter:
                                            ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn)),
                                      ),
                                    ),
                                  )
                              ),
                            ),
                            Visibility(
                              visible: true,
                              child: Positioned(
                                right: 68,
                                  bottom: 14,
                                  child: Container(
                                    width: 250,
                                    child: SpeechBalloon(
                                      nipLocation: NipLocation.right,
                                      color: Colors.black.withOpacity(0.6),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                                        child: Text(
                                          '현 위치가 다른 경우 페이지를 새로고침해주세요.',
                                          style: DaepiroTextStyle.caption.copyWith(color: DaepiroColorStyle.g_50),
                                        ),
                                      ),
                                    ),
                                  )
                              ),
                            )
                          ],
                        )
                      ),
                      SizedBox(height: 24),
                      locationCheckWidget(state.isSuccessCertificate),
                      SizedBox(height: 8),
                      state.isSuccessCertificate
                          ? Text('인증하기를 눌러 동네 인증을 완료해주세요.',
                              style: DaepiroTextStyle.body_2_m
                                  .copyWith(color: DaepiroColorStyle.g_500))
                          : Text(
                              '현재 \‘${selectAddress}\' 동네 생활에 있어요.\n현 위치가 동네와 다르면 위치를 노출할 수 없어요.',
                              style: DaepiroTextStyle.body_2_m
                                  .copyWith(color: DaepiroColorStyle.g_500),
                            ),
                      SizedBox(height: 16),
                      notificationWidget(),
                      Spacer(),
                      state.isSuccessCertificate
                          ? Expanded(
                              child: PrimaryFilledButton(
                                  backgroundColor: DaepiroColorStyle.g_700,
                                  pressedColor: DaepiroColorStyle.g_600,
                                  onPressed: () => successDialog(context),
                                  borderRadius: 8,
                                  child: Text(
                                    '인증하기',
                                    style: DaepiroTextStyle.body_1_b.copyWith(
                                        color: DaepiroColorStyle.white),
                                  ),
                                  verticalPadding: 12),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: PrimaryFilledButton(
                                        backgroundColor:
                                            DaepiroColorStyle.g_200,
                                        pressedColor: DaepiroColorStyle.g_200,
                                        onPressed: null,
                                        borderRadius: 8,
                                        child: Text(
                                          '인증하기',
                                          style: DaepiroTextStyle.body_1_b
                                              .copyWith(
                                                  color:
                                                      DaepiroColorStyle.g_75),
                                        ),
                                        verticalPadding: 12),
                                  )
                                ],
                              ),
                            )
                    ],
                  ),
                )
              : Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.6)),
                )),
    );
  }

  Widget headerWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: GestureDetector(
              onTap: () => stopDialog(context),
              child: SvgPicture.asset('assets/icons/icon_arrow_left.svg',
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                      DaepiroColorStyle.g_900, BlendMode.srcIn)),
            ),
          ),
          Expanded(
            child: Text(
              '동네 인증',
              textAlign: TextAlign.center,
              style:
                  DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_800),
            ),
          ),
          Container(
            width: 24,
            height: 24,
          )
        ],
      ),
    );
  }

  Widget addressWidget(String address) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 19),
        child: Row(
          children: [
            Text(
              '선택한 동네',
              style: DaepiroTextStyle.body_1_b
                  .copyWith(color: DaepiroColorStyle.g_900),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(99),
                  color: DaepiroColorStyle.o_50),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  address,
                  style: DaepiroTextStyle.body_2_m
                      .copyWith(color: DaepiroColorStyle.o_500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  //동네인증 안내 다이얼로그
  void certificateNeedDialog(BuildContext context, WidgetRef ref) {
    return basicDialog(
      context,
      Text(
        '동네인증이 필요해요',
        style:
            DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.g_900),
      ),
      Text(
        textAlign: TextAlign.center,
        '동네 주민임을 인증하고 투명한 정보를 교환해요!\n1개의 지역에 대해 주민 뱃지를 얻을 수 있어요.',
        style:
            DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.g_500),
      ),
      SecondaryFilledButton(
          verticalPadding: 12,
          onPressed: () {
            GoRouter.of(context).pop();
            GoRouter.of(context).pop();
          },
          radius: 8,
          backgroundColor: DaepiroColorStyle.g_50,
          pressedColor: DaepiroColorStyle.g_75,
          child: Text(
            textAlign: TextAlign.center,
            '나중에 하기',
            style: DaepiroTextStyle.body_1_b
                .copyWith(color: DaepiroColorStyle.g_700),
          )),
      SecondaryFilledButton(
          verticalPadding: 12,
          onPressed: () {
            ref.read(townCertificateProvider.notifier).setFirstStep(false);
            ref.read(townCertificateProvider.notifier).setSecondStep(true);
          },
          radius: 8,
          backgroundColor: DaepiroColorStyle.g_700,
          pressedColor: DaepiroColorStyle.g_400,
          child: Text(
            textAlign: TextAlign.center,
            '동네 인증하기',
            style: DaepiroTextStyle.body_1_b
                .copyWith(color: DaepiroColorStyle.white),
          )),
    );
  }

  void selectCertificateAddressDialog(BuildContext context,
      List<String> townList, WidgetRef ref, bool isPermissionGrant) {
    Navigator.of(context, rootNavigator: true).pop();
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: DaepiroColorStyle.white,
              titlePadding: EdgeInsets.fromLTRB(20, 24, 20, 4),
              title: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '내 동네를 선택해주세요.',
                      style: DaepiroTextStyle.body_1_b
                          .copyWith(color: DaepiroColorStyle.g_900),
                    ),
                  ]),
              contentPadding: EdgeInsets.fromLTRB(20, 4, 20, 24),
              content: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      '동네 주민임을 인증하고 투명한 정보를 교환해요!\n1개의 지역에 대해 주민 뱃지를 얻을 수 있어요.',
                      style: DaepiroTextStyle.body_2_m
                          .copyWith(color: DaepiroColorStyle.g_500),
                    ),
                    SizedBox(height: 24),
                    ...List.generate(townList.length, (index) {
                      final selected = selectAddress == townList[index];
                      return ConstrainedBox(
                        constraints: BoxConstraints(minWidth: double.infinity),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectAddress = townList[index];
                                ref
                                    .read(townCertificateProvider.notifier)
                                    .setSelectAddress(selectAddress);
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: selected
                                    ? DaepiroColorStyle.g_75
                                    : DaepiroColorStyle.g_50,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                overlayColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                shadowColor: Colors.transparent,
                                elevation: 0.0),
                            child: Text(
                              townList[index],
                              style: DaepiroTextStyle.body_1_b
                                  .copyWith(color: DaepiroColorStyle.g_700),
                            ),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: SecondaryFilledButton(
                              verticalPadding: 12,
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                                GoRouter.of(context).pop();
                                ref
                                    .read(townCertificateProvider.notifier)
                                    .selectCertificateTown('');
                              },
                              radius: 8,
                              backgroundColor: DaepiroColorStyle.g_50,
                              pressedColor: DaepiroColorStyle.g_75,
                              child: Text(
                                textAlign: TextAlign.center,
                                '나중에 하기',
                                style: DaepiroTextStyle.body_1_b
                                    .copyWith(color: DaepiroColorStyle.g_700),
                              )),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                            child: SecondaryFilledButton(
                          onPressed: selectAddress.isNotEmpty
                              ? () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                  ref
                                      .read(townCertificateProvider.notifier)
                                      .selectCertificateTown(selectAddress);
                                  ref
                                      .read(townCertificateProvider.notifier)
                                      .setSecondStep(false);
                                  if (!isPermissionGrant) {
                                    locationPermissionDialog(context);
                                  }
                                }
                              : null,
                          radius: 8,
                          child: Text(
                            textAlign: TextAlign.center,
                            '선택하기',
                            style: selectAddress.isNotEmpty
                                ? DaepiroTextStyle.body_1_b
                                    .copyWith(color: DaepiroColorStyle.white)
                                : DaepiroTextStyle.body_1_b
                                    .copyWith(color: DaepiroColorStyle.g_75),
                          ),
                          backgroundColor: selectAddress.isNotEmpty
                              ? DaepiroColorStyle.g_700
                              : DaepiroColorStyle.g_200,
                        ))
                      ],
                    )
                  ],
                );
              }));
        });
  }

  void locationPermissionDialog(BuildContext context) {
    basicDialog(
      context,
      Text(
        '위치 허용이 필요해요',
        style:
            DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.g_900),
      ),
      Text(
        textAlign: TextAlign.center,
        '현 위치 노출을 위해 위치 권한을 허용해주세요.',
        style:
            DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.g_500),
      ),
      SecondaryFilledButton(
          verticalPadding: 12,
          onPressed: () {
            GoRouter.of(context).pop();
            GoRouter.of(context).pop();
          },
          radius: 8,
          backgroundColor: DaepiroColorStyle.g_50,
          pressedColor: DaepiroColorStyle.g_75,
          child: Text(
            textAlign: TextAlign.center,
            '그만두기',
            style: DaepiroTextStyle.body_1_b
                .copyWith(color: DaepiroColorStyle.g_700),
          )),
      SecondaryFilledButton(
          verticalPadding: 12,
          onPressed: () {
            openAppSettings();
          },
          radius: 8,
          backgroundColor: DaepiroColorStyle.g_700,
          pressedColor: DaepiroColorStyle.g_400,
          child: Text(
            textAlign: TextAlign.center,
            '허용하기',
            style: DaepiroTextStyle.body_1_b
                .copyWith(color: DaepiroColorStyle.white),
          )),
    );
  }

  Widget locationCheckWidget(bool checkSuccess) {
    return Container(
      decoration: BoxDecoration(
          color:
              checkSuccess ? DaepiroColorStyle.gre_50 : DaepiroColorStyle.r_50,
          borderRadius: BorderRadius.circular(8)),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Row(
          children: [
            checkSuccess
                ? SvgPicture.asset('assets/icons/icon_certification.svg',
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                        DaepiroColorStyle.gre_500, BlendMode.srcIn))
                : SvgPicture.asset('assets/icons/icon_warning.svg',
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                        DaepiroColorStyle.r_400, BlendMode.srcIn)),
            SizedBox(width: 8),
            checkSuccess
                ? Text(
                    '위치가 확인되었습니다.',
                    style: DaepiroTextStyle.body_1_b
                        .copyWith(color: DaepiroColorStyle.gre_500),
                  )
                : Text('선택한 동네과 현 위치가 다릅니다.',
                    style: DaepiroTextStyle.body_1_b
                        .copyWith(color: DaepiroColorStyle.r_400))
          ],
        ),
      ),
    );
  }

  Widget notificationWidget() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: DaepiroColorStyle.g_50),
      child: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '동네 인증 전에 확인해요!',
              style: DaepiroTextStyle.body_2_b
                  .copyWith(color: DaepiroColorStyle.g_500),
            ),
            SizedBox(height: 6),
            Text(
              '주민 뱃지는 1개만 얻을 수 있으니 신중하게 선택해주세요.\n투명한 정보를 위해 동네 변경은 1달에 1회만 가능해요.',
              style: DaepiroTextStyle.body_2_m
                  .copyWith(color: DaepiroColorStyle.g_500),
            ),
          ],
        ),
      ),
    );
  }

  //TODO 인증을 취소하는 로직 필요 -> 현재는 들어오기만 하면 자동으로 인증하는 api 전송
  void stopDialog(BuildContext context) {
    basicDialog(
      context,
      Column(
        children: [
          SvgPicture.asset('assets/icons/icon_warning.svg',
              width: 48,
              height: 48,
              colorFilter:
                  ColorFilter.mode(DaepiroColorStyle.o_300, BlendMode.srcIn)),
          SizedBox(height: 8),
          Text(
            '나중에 다시 하시겠습니까?',
            style: DaepiroTextStyle.body_1_b
                .copyWith(color: DaepiroColorStyle.g_700),
          )
        ],
      ),
      Text(
        '지금 중단하면 뱃지가 사라져요.\n뱃지는 ‘동네 인증하기’에서 다시 얻을 수 있어요.',
        style:
            DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.g_500),
      ),
      SecondaryFilledButton(
          verticalPadding: 12,
          onPressed: () {
            GoRouter.of(context).pop();
          },
          radius: 8,
          backgroundColor: DaepiroColorStyle.g_50,
          pressedColor: DaepiroColorStyle.g_75,
          child: Text(
            textAlign: TextAlign.center,
            '인증하기',
            style: DaepiroTextStyle.body_1_b
                .copyWith(color: DaepiroColorStyle.g_700),
          )),
      SecondaryFilledButton(
          verticalPadding: 12,
          onPressed: () {
            GoRouter.of(context).pop();
            GoRouter.of(context).pop();
          },
          radius: 8,
          backgroundColor: DaepiroColorStyle.g_700,
          pressedColor: DaepiroColorStyle.g_400,
          child: Text(
            textAlign: TextAlign.center,
            '나중에 하기',
            style: DaepiroTextStyle.body_1_b
                .copyWith(color: DaepiroColorStyle.white),
          )),
    );
  }

  void successDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            backgroundColor: DaepiroColorStyle.white,
            titlePadding: EdgeInsets.fromLTRB(0, 24, 0, 8),
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/icon_certification.svg',
                    width: 48,
                    height: 48,
                    colorFilter: ColorFilter.mode(
                        DaepiroColorStyle.o_300, BlendMode.srcIn)),
                SizedBox(height: 8)
              ],
            ),
            content: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '‘${selectAddress}’ 주민 뱃지를 얻었어요!',
                      style: DaepiroTextStyle.body_1_b
                          .copyWith(color: DaepiroColorStyle.g_700),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '동네생활에서 주민들과 함께\n안전한 동네를 만들어요.',
                      style: DaepiroTextStyle.body_1_b
                          .copyWith(color: DaepiroColorStyle.g_500),
                    ),
                  ]),
            ),
            actions: <Widget>[
              Row(
                children: [
                  Expanded(
                      child: PrimaryFilledButton(
                          backgroundColor: DaepiroColorStyle.g_50,
                          pressedColor: DaepiroColorStyle.g_50,
                          borderRadius: 8,
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true).pop();
                            GoRouter.of(context).pop();
                          },
                          child: Text('닫기'),
                          verticalPadding: 12)),
                ],
              ),
            ],
          );
        });
  }

  void basicDialog(BuildContext context, Widget titleWidget,
      Widget contentWidget, Widget doneWidget, Widget actionWidget) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: DaepiroColorStyle.white,
            titlePadding: EdgeInsets.fromLTRB(20, 24, 20, 4),
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [titleWidget],
            ),
            contentPadding: EdgeInsets.fromLTRB(20, 4, 20, 24),
            content: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [contentWidget]),
            ),
            actions: <Widget>[
              Row(
                children: [
                  Expanded(child: doneWidget),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(child: actionWidget)
                ],
              ),
            ],
          );
        });
  }
}
