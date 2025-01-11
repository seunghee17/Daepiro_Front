import 'package:daepiro/presentation/community/controller/community_town_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../cmm/DaepiroTheme.dart';

class CommunityTownWritingScreen extends ConsumerStatefulWidget {
  const CommunityTownWritingScreen({super.key});

  @override
  CommunityTownWritingState createState() => CommunityTownWritingState();
}

//동네생활 글쓰기 화면
class CommunityTownWritingState extends ConsumerState<CommunityTownWritingScreen> {
  bool isTouched = false;
  bool isWritingContainerPress = false;
  TextEditingController titleTextController = TextEditingController();
  TextEditingController contentTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(communityTownProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerWidget(context),
              SizedBox(height: 12),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    writingTypeWidget(state.townCategory),
                    SizedBox(height: 20,),
                    titleTextField(titleTextController),
                    SizedBox(height: 16,),
                    contentTextField(contentTextController),
                    SizedBox(height: 20,),
                    photoWidget(),
                    SizedBox(height: 20)
                  ],
                ),
              )),
              locationCheckWidget(state.isVisible),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerWidget(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {

              }, //TODO 상태변수 초기화
              child: SvgPicture.asset('assets/icons/icon_arrow_left.svg',
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                      DaepiroColorStyle.g_900, BlendMode.srcIn)),
            ),
            Expanded(
              child: Text(
                '글쓰기',
                textAlign: TextAlign.center,
                style: DaepiroTextStyle.h6
                    .copyWith(color: DaepiroColorStyle.g_800),
              ),
            ),
            GestureDetector(
                onTap: () {}, //TODO 활성화 조건에 따른 완료 처리
                child: Text(
                  '완료', //TODO 색상 수정해야함
                  style: DaepiroTextStyle.body_1_m
                      .copyWith(color: titleTextController.text.length >0 && contentTextController.text.length > 0 ? DaepiroColorStyle.o_500 : DaepiroColorStyle.g_100),
                )),
          ],
        ),
      ),
    );
  }

  Widget writingTypeWidget(String writingType) {
    //일상, 교통 등등이 매개변수
    return InkWell(
      onTap: () {
        showCategoryBottomSheet(context, isTouched, isWritingContainerPress);
        setState(() {
          isWritingContainerPress = true;
        });
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: DaepiroColorStyle.g_50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1.5,
              color: isWritingContainerPress ? DaepiroColorStyle.g_75 : DaepiroColorStyle.g_50
            )),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              writingType == '전체'
                  ? Text(
                      '게시글 주제를 선택해주세요.',
                      style: DaepiroTextStyle.body_1_m
                          .copyWith(color: DaepiroColorStyle.g_300),
                    )
                  : Text(
                      writingType,
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
      ),
    );
  }

  Widget titleTextField(TextEditingController controller) {
    return Container(
      width: double.infinity,
      child: TextField(
        controller: controller,
        maxLength: 38,
        cursorColor: DaepiroColorStyle.g_900,
        onTapOutside: (event) =>
            FocusManager.instance.primaryFocus?.unfocus(),
        style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_900),
        decoration: InputDecoration(
          counterText: '',
          isDense: true,
          hintText: '제목을 입력하세요.',
          hintStyle: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_75),
          contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: DaepiroColorStyle.g_75)
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: DaepiroColorStyle.g_75)
          ),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: DaepiroColorStyle.g_75)
          ),
        ),
      ),
    );
  }

  Widget contentTextField(TextEditingController controller) {
    return Container(
      width: double.infinity,
      height: 343,
      child: TextField(
        controller: controller,
        maxLength: 38,
        cursorColor: DaepiroColorStyle.g_900,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        style: DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.g_900),
        decoration: InputDecoration(
          counterText: '',
          isDense: true,
          hintText: '동네생활과 관련된 이야기를 주민들과 나누세요.',
          hintStyle: DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.g_200),
          contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide.none
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide.none
          ),
        ),
      ),
    );
  }

  Widget photoWidget() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('사진/동영상',
          style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_900)),
          SizedBox(height: 8)
        ],
      ),
    );
  }

  Widget locationCheckWidget(bool isVisible) {
    return ElevatedButton(
      onPressed: () async {
        await ref.read(communityTownProvider.notifier).setVisibleState();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: DaepiroColorStyle.g_50,
        overlayColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        shadowColor: Colors.transparent,
        elevation: 0.0
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(12, 12, 0, 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(
                visualDensity: VisualDensity.compact,
                side: BorderSide(color: Colors.transparent),
                activeColor: DaepiroColorStyle.g_500,
                checkColor: DaepiroColorStyle.white,
                fillColor: MaterialStateProperty.resolveWith((state) {
                  if(!state.contains(MaterialState.selected)) {
                    return DaepiroColorStyle.g_100;
                  }
                  return null;
                }),
                value: isVisible,
                onChanged: (value) async {
                  await ref.read(communityTownProvider.notifier).setVisibleState();
                }),
            SizedBox(width: 8),
            Text(
              '현위치를 표시하겠어요?',
              style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_800),
            )
          ],
        ),
      ),
    );
  }

  //카테고리 선택 바텀시트
  void showCategoryBottomSheet(BuildContext context, bool isTouched, bool isWritingContainerPress) {
    showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        builder: (context) {
          return Wrap(
            children: [
              Container(
                child: Column(
                  children: [categoryItemWidget(isTouched, isWritingContainerPress)],
                ),
              ),
            ],
          );
        },
        isScrollControlled: true);
  }

  //바텀시트 내부 위젯
  Widget categoryItemWidget(bool isTouched, bool isWritingContainerPress) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          )),
      child: Column(
        children: [
          bottomSheetheaderWidget(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        isWritingContainerPress = false;
                      });
                    },
                    child: categoryListItem('일상')),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        isWritingContainerPress = false;
                      });
                    },
                    child: categoryListItem('교통')),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        isWritingContainerPress = false;
                      });
                    },
                    child: categoryListItem('치안')),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        isWritingContainerPress = false;
                      });
                    },
                    child: categoryListItem('기타')),
              ],
            ),
          )
        ],
      ),
    );
  }

  //바텀시트 내부 헤더
  Widget bottomSheetheaderWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
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
                    '게시글 주제',
                    textAlign: TextAlign.center,
                    style: DaepiroTextStyle.body_1_b
                        .copyWith(color: DaepiroColorStyle.g_900),
                  ),
                ),
                GestureDetector(
                  onTap: ()=>
                    GoRouter.of(context).pop()
                  ,
                  child: SvgPicture.asset('assets/icons/icon_close.svg',
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                          DaepiroColorStyle.g_900, BlendMode.srcIn)),
                ),
                SizedBox(width: 16),
              ],
            ),
            SizedBox(height: 16),
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

  Widget categoryListItem(String category) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isTouched ? DaepiroColorStyle.white : DaepiroColorStyle.g_50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          ref
              .read(communityTownProvider.notifier)
              .setCategoryState(category);
          setState(() {
            isTouched = !isTouched;
            isWritingContainerPress = !isWritingContainerPress;
          });
          GoRouter.of(context).pop();
        },
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            category,
            style: DaepiroTextStyle.body_1_m
                .copyWith(color: DaepiroColorStyle.g_900),
          ),
        ),
      ),
    );
  }
}
