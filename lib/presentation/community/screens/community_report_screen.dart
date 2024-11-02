import 'package:daepiro/presentation/widgets/button/primary_filled_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../widgets/DaepiroTheme.dart';
import '../community_view_model.dart';

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
    final communityViewModel = ref.watch(communityViewModelProvider);
    return communityViewModel.when(
        data: (state) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerWidget(),
                SizedBox(height: 20),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '어떤 점이 불편하셨나요?',
                        style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_900),
                      ),
                      SizedBox(height: 16),
                      //TODO 수정하기
                      //reportTypeWidget(state.reportType, true),
                      SizedBox(height: 16),
                      contentWriteWidget(screenHeight),
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
          );
        },
        error: (error, state) => Center(child: Text('error: ${error}')),
        loading: () => const Center(child: CircularProgressIndicator()),);
  }

  Widget headerWidget() {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/arrow_left.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn)
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Text(
              '신고하기',
              textAlign: TextAlign.center,
              style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_800),
            ),
          )
        ],
      ),
    );
  }

  Widget reportTypeWidget(String reportType, bool isTouch) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: DaepiroColorStyle.g_200,
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
            Text(
              '신고 유형을 선택해주세요 (필수)'
            ),
            Spacer(),
            SvgPicture.asset('assets/icons/arrow_down.svg',
                colorFilter: ColorFilter.mode(DaepiroColorStyle.o_400, BlendMode.srcIn)
            ),
          ],
        ),
      ),
    );
  }

  Widget contentWriteWidget(double screenHeight) {
    return Container(
      width: double.infinity,
      height: screenHeight * 0.4,
      child: TextField(
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
            borderRadius: BorderRadius.all(Radius.circular(8))
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))
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