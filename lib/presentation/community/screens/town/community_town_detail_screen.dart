import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../cmm/DaepiroTheme.dart';

class CommunityTownDetailScreen extends ConsumerWidget {
  const CommunityTownDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  headerWidget(),
                  contentWidget(),
                ],
              ),
            ),
          ),
          Spacer(),
          footerWidget()
        ],
      ),
    ));
  }

  //헤더 위젯
  Widget headerWidget() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SvgPicture.asset('assets/icons/icon_arrow_left.svg',
              width: 24,
              height: 24,
              colorFilter:
                  ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn)),
        ),
        Expanded(
            child: Text(
          textAlign: TextAlign.center,
          '일상',
          style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_800),
        )),
        Opacity(
          opacity: 0.0,
          child: SvgPicture.asset(
            'assets/icons/icon_close.svg',
            width: 24,
            height: 24,
          ),
        ),
      ],
    );
  }

  Widget contentWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            //TODO 서버로부터 사진형식 보고 다시 수정해야함
            Container(
              decoration: BoxDecoration(
                  color: DaepiroColorStyle.g_600,
                  borderRadius: BorderRadius.circular(999)),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text('김연지',
                      style: DaepiroTextStyle.body_2_b
                          .copyWith(color: DaepiroColorStyle.g_800)),
                  Visibility(
                    visible: true,
                    child: SvgPicture.asset(
                        'assets/icons/icon_certification.svg',
                        width: 16,
                        height: 16,
                        colorFilter: ColorFilter.mode(
                            DaepiroColorStyle.o_300, BlendMode.srcIn)),
                  ),
                ]),
                const SizedBox(height: 2),
                Text('5분전',
                    style: DaepiroTextStyle.caption
                        .copyWith(color: DaepiroColorStyle.g_300)),
              ],
            ),
            Spacer(),
            GestureDetector(
              //TODO 추가적 로직
              onTap: () {},
              child: SvgPicture.asset('assets/icons/icon_more.svg',
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                      DaepiroColorStyle.g_200, BlendMode.srcIn)),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          '새로운 카페 오픈했네요',
          style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_900),
        ),
        const SizedBox(height: 8),
        Text(
          '어쩌구저쩌구이걸우째저걸우째',
          style: DaepiroTextStyle.body_2_m
              .copyWith(color: DaepiroColorStyle.g_400),
        ),
        Visibility(
            visible: false,
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    //TODO 사진아이템 추가
                  }),
            )),
        SizedBox(height: 20),
      ],
    );
  }

  //TODO 수정해야함
  Widget footerWidget() {
    return Container(
      width: double.infinity,
      height: 108,
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: DaepiroColorStyle.g_50))),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                //TODO 이미지 피커 추가
              },
              child: SvgPicture.asset('assets/icons/icon_photo.svg',
                  width: 28,
                  height: 28,
                  colorFilter: ColorFilter.mode(
                      DaepiroColorStyle.g_400, BlendMode.srcIn)),
            ),
            SizedBox(width: 12),
            Expanded(
              //TODO: 1000자 제한 추가하기
              child: Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, top: 12, bottom: 12, right: 12),
                      child: TextField(
                        cursorColor: DaepiroColorStyle.g_900,
                        onTapOutside: (event) =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        style: DaepiroTextStyle.body_2_m
                            .copyWith(color: DaepiroColorStyle.g_900),
                        decoration: InputDecoration(
                          filled: true,
                          isDense: true,
                          hintText: '댓글을 작성해주세요.',
                          fillColor: DaepiroColorStyle.g_50,
                          hintStyle: DaepiroTextStyle.body_2_m
                              .copyWith(color: DaepiroColorStyle.g_200),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
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
                    ),
                    Text('등록'),
                    SizedBox(
                      width: 16,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: 20)
          ],
        ),
      ),
    );
  }
}
