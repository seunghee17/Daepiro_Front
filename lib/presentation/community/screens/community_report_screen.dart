import 'package:daepiro/presentation/community/controller/community_disaster_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../cmm/DaepiroTheme.dart';
import '../../../cmm/button/primary_filled_button.dart';

class CommunityReportScreen extends ConsumerStatefulWidget {
  @override
  CommunityReportState createState() => CommunityReportState();
}

class CommunityReportState extends ConsumerState<CommunityReportScreen> {
  final TextEditingController contentEditingController = TextEditingController();
  final TextEditingController mailEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final viewModel = ref.watch(communityDisasterProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerWidget(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        '어떤 점이 불편하셨나요?',
                        style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_900),
                      ),
                      SizedBox(height: 16),
                      //TODO 신고유형 추가하기
                      GestureDetector(
                        onTap: (){},
                          child: reportTypeWidget('신고')
                      ),
                      SizedBox(height: 16),
                      contentWriteWidget(screenHeight),
                      SizedBox(height: 16),
                      Text(
                        '연락받을 메일 주소',
                        style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_900),
                      ),
                      SizedBox(height: 8),
                      mailWriteWidget(),
                      SizedBox(height: 20)
                    ],
                  ),
                ),
              ),
              footerWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget headerWidget() {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: GestureDetector(
              onTap: () => GoRouter.of(context).pop,
              child: SvgPicture.asset('assets/icons/icon_arrow_left.svg',
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn)
              ),
            ),
          ),
          Expanded(
            child: Text(
              '신고하기',
              textAlign: TextAlign.center,
              style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_800),
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
            reportType == 'NONE' ?
            Text(
              '신고 유형을 선택해주세요 (필수)',
              style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_300),
            ) :
            Text(
                reportType,
              style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_900),
            ),
            Spacer(),
            SvgPicture.asset('assets/icons/icon_arrow_down.svg',
                colorFilter: ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn)
            ),
          ],
        ),
      ),
    );
  }

  Widget contentWriteWidget(double screenHeight) {
    return Container(
      height: 341,
      child: TextField(
        expands: true,
        maxLines: null,
        style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_900),
        cursorColor: DaepiroColorStyle.g_900,
        textAlignVertical: TextAlignVertical(y: -1),
        controller: contentEditingController,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 16, left: 16, right: 16),
            filled: true,
            isDense: true,
            fillColor: DaepiroColorStyle.g_50,
            hintText: '불편했던 사항을 구체적으로 작성해주세요.',
            hintStyle: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_200),
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
            suffixText: '${contentEditingController.text.length}/1000'
        ),

      ),
    );
  }

  Widget mailWriteWidget() {
    return Container(
      width: double.infinity,
      child: TextField(
        style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_900),
        cursorColor: DaepiroColorStyle.g_900,
        controller: mailEditingController,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16),
          filled: true,
          fillColor: DaepiroColorStyle.g_50,
          hintText: '메일 주소를 입력해주세요',
          hintStyle: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_200),
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

  Widget footerWidget() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
      child: Container(
        width: double.infinity,
        child: PrimaryFilledButton(
            backgroundColor: DaepiroColorStyle.g_700,
            pressedColor: DaepiroColorStyle.g_600,
            borderRadius: 8,
            child: Text(
              '접수하기',
              style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.white),
            ),
            verticalPadding: 12
        ),
      ),
    );
  }

  void deSelectReportTypeDialog(BuildContext context) {
    showDialog(
        context: context, 
        barrierDismissible: false,
        builder: (BuildContext context) {
          Future.delayed(Duration(seconds: 3), () {
            GoRouter.of(context).pop();
          });
          return AlertDialog(
            backgroundColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(vertical: 20),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/icon_warning',
                colorFilter: ColorFilter.mode(
                    DaepiroColorStyle.r_200, BlendMode.srcIn)),
                SizedBox(height: 8),
                Text(
                  '신고 유형을 선택해주세요',
                  style: DaepiroTextStyle.body_1_b
                      .copyWith(color: DaepiroColorStyle.g_900),
                )
              ],
            ),
          );
        }
    );
  }

  void successReportDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          Future.delayed(Duration(seconds: 3), () {
            GoRouter.of(context).pop();
          });
          return AlertDialog(
            backgroundColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(vertical: 24),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '신고가 정상적으로 접수되었습니다',
                  style: DaepiroTextStyle.body_1_b
                      .copyWith(color: DaepiroColorStyle.g_900),
                ),
                SizedBox(height: 8),
                Text(
                  '신고 유형을 선택해주세요',
                  style: DaepiroTextStyle.body_1_m
                      .copyWith(color: DaepiroColorStyle.g_500),
                )
              ],
            ),
          );
        }
    );
  }

  // void showBottomSheet(BuildContext context) {
  //   showModalBottomSheet(
  //       context: context,
  //       useRootNavigator: true,
  //       backgroundColor: Colors.transparent,
  //       builder: (context) {
  //         final height = MediaQuery.of(context).size.height * 0.5;
  //         return Container(
  //           height: height,
  //           child: ,
  //         );
  //       },
  //     isScrollControlled: true,
  //     enableDrag: false,
  //     isDismissible: true
  //   );
  // }

  Widget reportType() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          )
      ),
      child: Column(
        children: [
          reportBoottmHeaderWidget()
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
                SizedBox(width: 16),
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
                      colorFilter: ColorFilter.mode(
                          DaepiroColorStyle.g_900, BlendMode.srcIn)),
                ),
                SizedBox(width: 20),
              ],
            ),
            Container(
              decoration: BoxDecoration(color: DaepiroColorStyle.g_50),
              width: double.infinity,
              height: 1,
            )
          ],
        ),
      ),
    );
  }


}