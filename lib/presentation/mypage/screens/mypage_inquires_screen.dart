import 'package:daepiro/presentation/mypage/controller/mypage_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../cmm/DaepiroTheme.dart';
import '../../../cmm/button/primary_filled_button.dart';
import '../../../cmm/button/secondary_filled_button.dart';

class MyPageInquiresScreen extends ConsumerStatefulWidget {
  const MyPageInquiresScreen({super.key});

  @override
  MyPageInquiresState createState() => MyPageInquiresState();
}

class MyPageInquiresState extends ConsumerState<MyPageInquiresScreen> {
  final TextEditingController contentEditingController = TextEditingController();
  final TextEditingController mailEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(myPageProvider);

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
                        const SizedBox(height: 20),
                        Text(
                          '어떤 점이 궁금하신가요?',
                          style: DaepiroTextStyle.h6
                              .copyWith(color: DaepiroColorStyle.g_900),
                        ),
                        const SizedBox(height: 16),
                        GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  enableDrag: false,
                                  isDismissible: true,
                                  context: context,
                                  builder: (context) {
                                    return inquireTypeBottomSheet(state.inquireTypeList);
                                  });
                            },
                            child: inquireTypeWidget(state.inquireType)),
                        const SizedBox(height: 16),
                        contentWriteWidget(),
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
                  )
              ),
              footerWidget()
            ],
          ),
        ),
      )
    );
  }

  Widget headerWidget() {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: GestureDetector(
              onTap: () => GoRouter.of(context).pop(),
              child: SvgPicture.asset('assets/icons/icon_arrow_left.svg',
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                      DaepiroColorStyle.g_900, BlendMode.srcIn)),
            ),
          ),
          Expanded(
            child: Text(
              '문의하기',
              textAlign: TextAlign.center,
              style:
              DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_800),
            ),
          ),
          const SizedBox(
            width: 24,
            height: 24,
          )
        ],
      ),
    );
  }

  Widget inquireTypeWidget(String inquireType) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: DaepiroColorStyle.g_50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            inquireType == ''
                ? Text(
              '문의 유형을 선택해주세요. (필수)',
              style: DaepiroTextStyle.body_1_m
                  .copyWith(color: DaepiroColorStyle.g_300),
            )
                : Text(
              inquireType,
              style: DaepiroTextStyle.body_1_m
                  .copyWith(color: DaepiroColorStyle.g_900),
            ),
            const Spacer(),
            SvgPicture.asset('assets/icons/icon_arrow_down.svg',
                colorFilter:
                const ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn)),
          ],
        ),
      ),
    );
  }

  //문의유형 선택 bottomsheet 화면
  Widget inquireTypeBottomSheet(List<String> inquireTypeList) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            topLeft: Radius.circular(12),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          inquireBoottmHeaderWidget(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                    itemCount: inquireTypeList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: SecondaryFilledButton(
                            verticalPadding: 16,
                            onPressed: () {
                              GoRouter.of(context).pop();
                              ref.read(myPageProvider.notifier).setInquireType(inquireTypeList[index]);
                            },
                            radius: 8,
                            backgroundColor: DaepiroColorStyle.white,
                            pressedColor: DaepiroColorStyle.g_50,
                            child: Row(
                              children: [
                                const SizedBox(width: 16),
                                Text(
                                  textAlign: TextAlign.start,
                                  inquireTypeList[index],
                                  style: DaepiroTextStyle.body_1_m
                                      .copyWith(color: DaepiroColorStyle.g_900),
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

  Widget inquireBoottmHeaderWidget() {
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
                    '문의 유형',
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

  Widget contentWriteWidget() {
    return SizedBox(
        height: 341,
        child: Stack(
          children: [
            TextField(
              expands: true,
              maxLines: null,
              maxLength: 1000,
              style: DaepiroTextStyle.body_1_m
                  .copyWith(color: DaepiroColorStyle.g_900),
              cursorColor: DaepiroColorStyle.g_900,
              textAlignVertical: const TextAlignVertical(y: -1),
              controller: contentEditingController,
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                counterText: '',
                filled: true,
                isDense: true,
                fillColor: DaepiroColorStyle.g_50,
                hintText: '궁금한 사항을 구체적으로 작성해주세요.',
                hintStyle: DaepiroTextStyle.body_1_m
                    .copyWith(color: DaepiroColorStyle.g_200),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                enabledBorder: const OutlineInputBorder(
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
    return SizedBox(
      width: double.infinity,
      child: TextField(
        style:
        DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_900),
        keyboardType: TextInputType.emailAddress,
        cursorColor: DaepiroColorStyle.g_900,
        controller: mailEditingController,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          filled: true,
          fillColor: DaepiroColorStyle.g_50,
          hintText: '메일 주소를 입력해주세요',
          hintStyle: DaepiroTextStyle.body_1_m
              .copyWith(color: DaepiroColorStyle.g_200),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          enabledBorder: const OutlineInputBorder(
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
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        width: double.infinity,
        child: PrimaryFilledButton(
            backgroundColor: mailEditingController.text.isNotEmpty &&
                contentEditingController.text.isNotEmpty
                ? DaepiroColorStyle.g_700
                : DaepiroColorStyle.g_200,
            onPressed: () async {
              if (mailEditingController.text.isNotEmpty &&
                  contentEditingController.text.isNotEmpty) {
                await ref.read(myPageProvider.notifier).setInquires(contentEditingController.text, mailEditingController.text);
              } else {
                //TODO 경고 다이얼로그
                null;
              }
              GoRouter.of(context).pop();
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
}