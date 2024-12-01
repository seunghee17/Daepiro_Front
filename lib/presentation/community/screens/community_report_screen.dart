import 'package:daepiro/presentation/community/community_disaster_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../cmm/DaepiroTheme.dart';

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
    final communityViewModel = ref.watch(communityDisasterProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerWidget(),
              SingleChildScrollView(
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
                    reportTypeWidget('신고', false),
                    SizedBox(height: 16),
                    contentWriteWidget(screenHeight),
                    SizedBox(height: 16),
                    Text(
                      '연락받을 메일 주소',
                      style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_900),
                    ),
                    SizedBox(height: 8),
                    mailWriteWidget(),
                    SizedBox(height: 16)
                  ],
                ),
              ),
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

  Widget reportTypeWidget(String? reportType, bool isTouch) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: DaepiroColorStyle.g_50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isTouch ? DaepiroColorStyle.g_100 : Colors.transparent,
          width: 1.5
        )
      ),
      child: Padding(
          padding: EdgeInsets.all(16),
        child: Row(
          children: [
            reportType == null ?
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
        controller: mailEditingController,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16),
          filled: true,
          fillColor: DaepiroColorStyle.g_50,
          hintText: '메일 주소를 입력해주세요',
          hintStyle: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_200),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))
          ),
        ),
      ),
    );
  }

  // Widget footerWidget() {
  //   return Column(
  //     children: [
  //       SizedBox(height: 20),
  //       PrimaryFilledButton(
  //           backgroundColor: backgroundColor,
  //           pressedColor: pressedColor,
  //           borderRadius: borderRadius,
  //           child: child,
  //           verticalPadding: verticalPadding
  //       ),
  //       SizedBox(height: 16)
  //     ],
  //   );
  // }
}