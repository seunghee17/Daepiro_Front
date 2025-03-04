import 'package:daepiro/presentation/mypage/controller/mypage_viewmodel.dart';
import 'package:daepiro/presentation/sponsor/sponsor_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:daepiro/presentation/const/utils.dart';
import '../../../../cmm/DaepiroTheme.dart';
import '../../../../cmm/button/primary_filled_button.dart';
import '../../../../cmm/button/secondary_filled_button.dart';

class CheerReportScreen extends ConsumerStatefulWidget {
  final int? id;

  const CheerReportScreen({super.key, this.id});

  @override
  CheerReportState createState() => CheerReportState();
}

class CheerReportState extends ConsumerState<CheerReportScreen> {
  final TextEditingController contentEditingController =
      TextEditingController();
  final TextEditingController mailEditingController = TextEditingController();
  late SponsorViewModel vm;

  @override
  void initState() {
    vm = ref.read(sponsorStateNotifierProvider.notifier);
    super.initState();
  }

  @override
  void dispose() {
    vm.setReportType('');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final disasterState = ref.watch(sponsorStateNotifierProvider);

    return PopScope(
      canPop: true,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          ref.read(myPageProvider.notifier).setInquireType('');
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerWidget(true),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          '어떤 점이 불편하셨나요?',
                          style: DaepiroTextStyle.h6
                              .copyWith(color: DaepiroColorStyle.g_900),
                        ),
                        SizedBox(height: 16),
                        GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  enableDrag: false,
                                  isDismissible: true,
                                  context: context,
                                  builder: (context) {
                                    return reportTypeBottomSheet(true, disasterState.reportDescription);});
                            },
                            child: reportTypeWidget(disasterState.reportType),
                        ),
                        const SizedBox(height: 16),
                        contentWriteWidget(screenHeight),
                        const SizedBox(height: 16),
                        Text(
                          '연락받을 메일 주소',
                          style: DaepiroTextStyle.body_1_m
                              .copyWith(color: DaepiroColorStyle.g_900),
                        ),
                        const SizedBox(height: 8),
                        mailWriteWidget(),
                        const SizedBox(height: 20)
                      ],
                    ),
                  ),
                ),
                footerWidget(true)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget headerWidget(bool isDisasterScreen) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: SvgPicture.asset('assets/icons/icon_arrow_left.svg',
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                      DaepiroColorStyle.g_900, BlendMode.srcIn)),
            ),
          ),
          Expanded(
            child: Text(
              '신고하기',
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

  Widget reportTypeWidget(String reportType) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: DaepiroColorStyle.g_50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            reportType == ''
                ? Text(
                    '신고 유형을 선택해주세요 (필수)',
                    style: DaepiroTextStyle.body_1_m
                        .copyWith(color: DaepiroColorStyle.g_300),
                  )
                : Text(
                    reportType,
                    style: DaepiroTextStyle.body_1_m
                        .copyWith(color: DaepiroColorStyle.g_900),
                  ),
            Spacer(),
            SvgPicture.asset('assets/icons/icon_arrow_down.svg',
                colorFilter:
                    ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn)),
          ],
        ),
      ),
    );
  }

  Widget contentWriteWidget(double screenHeight) {
    return Container(
        height: 341,
        child: Stack(
          children: [
            TextField(
              expands: true,
              keyboardType: TextInputType.emailAddress,
              maxLines: null,
              maxLength: 1000,
              style: DaepiroTextStyle.body_1_m
                  .copyWith(color: DaepiroColorStyle.g_900),
              cursorColor: DaepiroColorStyle.g_900,
              textAlignVertical: TextAlignVertical(y: -1),
              controller: contentEditingController,
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 16, left: 16, right: 16),
                counterText: '',
                filled: true,
                isDense: true,
                fillColor: DaepiroColorStyle.g_50,
                hintText: '불편했던 사항을 구체적으로 작성해주세요.',
                hintStyle: DaepiroTextStyle.body_1_m
                    .copyWith(color: DaepiroColorStyle.g_200),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.5,
                    color: DaepiroColorStyle.g_75,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
            Positioned(
                bottom: 16,
                right: 16,
                child: Text(
                  '${contentEditingController.text.length}/1000',
                  style: DaepiroTextStyle.body_1_m
                      .copyWith(color: DaepiroColorStyle.g_200),
                ))
          ],
        ));
  }

  Widget mailWriteWidget() {
    return Container(
      width: double.infinity,
      child: TextField(
        style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_900),
        keyboardType: TextInputType.emailAddress,
        cursorColor: DaepiroColorStyle.g_900,
        controller: mailEditingController,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16),
          filled: true,
          fillColor: DaepiroColorStyle.g_50,
          hintText: 'numberone@domain.com',
          hintStyle: DaepiroTextStyle.body_1_m
              .copyWith(color: DaepiroColorStyle.g_200),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.5,
              color: DaepiroColorStyle.g_75,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
    );
  }

  Widget footerWidget(bool isDisasterScreen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        width: double.infinity,
        child: PrimaryFilledButton(
            backgroundColor: mailEditingController.text.length > 0 &&
                    contentEditingController.text.length > 0 && isEmailValid(mailEditingController.text)
                ? DaepiroColorStyle.g_700
                : DaepiroColorStyle.g_200,
            onPressed: () async {
              if (mailEditingController.text.length > 0 &&
                  contentEditingController.text.length >0 &&
                  isEmailValid(mailEditingController.text)
              ) {
                late bool isSuccess;

                isSuccess = await ref.read(sponsorStateNotifierProvider.notifier)
                    .reportCheerComment(
                      id: widget.id ?? 0,
                      detail: contentEditingController.text,
                      type: ref.watch(sponsorStateNotifierProvider).reportType,
                      email: mailEditingController.text
                  );

                if(isSuccess) {
                  successReportDialog(context);
                }
                Future.delayed(Duration(seconds: 3), () {
                  if(context.mounted) {
                    context.pop();
                    context.pop();
                  } else {
                    null;
                  }
                });
              }
            },
            pressedColor: DaepiroColorStyle.g_600,
            borderRadius: 8,
            verticalPadding: 12,
            child: Text(
              '접수하기',
              style: DaepiroTextStyle.body_1_b
                  .copyWith(color: DaepiroColorStyle.white),
            )),
      ),
    );
  }

  void deSelectReportTypeDialog(BuildContext context, String content) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          Future.delayed(Duration(seconds: 3), () {
            context.pop();
          });
          return AlertDialog(
            backgroundColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(vertical: 20),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/icon_warning',
                    colorFilter: const ColorFilter.mode(
                        DaepiroColorStyle.r_200, BlendMode.srcIn)),
                const SizedBox(height: 8),
                Text(
                  content,
                  style: DaepiroTextStyle.body_1_b
                      .copyWith(color: DaepiroColorStyle.g_900),
                )
              ],
            ),
          );
        });
  }

  void successReportDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(vertical: 24),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '신고가 정상적으로 접수되었습니다.',
                  style: DaepiroTextStyle.body_1_b
                      .copyWith(color: DaepiroColorStyle.g_900),
                ),
                const SizedBox(height: 8),
                Text(
                  textAlign: TextAlign.center,
                  '답변은 메일 주소로 전송됩니다.\n건강한 소통을 위해 노력하겠습니다.',
                  style: DaepiroTextStyle.body_1_m
                      .copyWith(color: DaepiroColorStyle.g_500),
                )
              ],
            ),
          );
        });
  }

  //신고유형 선택 bottomsheet 화면
  Widget reportTypeBottomSheet(bool isDisasterScreen, List<String> reportDescription) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            topLeft: Radius.circular(12),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          reportBoottmHeaderWidget(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                    itemCount: reportDescription.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: SecondaryFilledButton(
                            verticalPadding: 16,
                            onPressed: () {
                              context.pop();
                              ref.read(sponsorStateNotifierProvider.notifier)
                                  .setReportType(reportDescription[index]);
                            },
                            radius: 8,
                            backgroundColor: DaepiroColorStyle.white,
                            pressedColor: DaepiroColorStyle.g_50,
                            child: Row(
                              children: [
                                const SizedBox(width: 16),
                                Text(
                                  textAlign: TextAlign.start,
                                  reportDescription[index],
                                  style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_900),
                                ),
                              ],
                            )),
                      );
                    })
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget reportBoottmHeaderWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 16),
                Opacity(
                  opacity: 0.0,
                  child: SvgPicture.asset(
                    'assets/icons/icon_close.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
                Expanded(
                  child: Text(
                    '신고 유형',
                    textAlign: TextAlign.center,
                    style: DaepiroTextStyle.body_1_b
                        .copyWith(color: DaepiroColorStyle.g_900),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset('assets/icons/icon_close.svg',
                      width: 24,
                      height: 24,
                      colorFilter: const ColorFilter.mode(
                          DaepiroColorStyle.g_900, BlendMode.srcIn)),
                ),
                const SizedBox(width: 20),
              ],
            ),
            Container(
              decoration: const BoxDecoration(color: DaepiroColorStyle.g_50),
              width: double.infinity,
              height: 1,
            )
          ],
        ),
      ),
    );
  }
}
