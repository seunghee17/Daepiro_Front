import 'package:daepiro/presentation/community/community_disaster_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../cmm/DaepiroTheme.dart';

//동네생활 화면
class CommunityTownScreen extends ConsumerWidget {
  CommunityTownScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //TODO 추후 state & viewmodel 단으로 이동해야하는 코드
    List<TypeModel> typeData = [];
    typeData.add(TypeModel(true, '전체'));
    typeData.add(TypeModel(false, '일상'));
    typeData.add(TypeModel(false, '교통'));
    typeData.add(TypeModel(false, '치안'));
    typeData.add(TypeModel(false, '기타'));
    final communityViewModel = ref.watch(communityDisasterProvider);
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                headerWidget(context),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: typeRadioButton(typeData),
                ),
                ...List.generate(
                    5,
                        (index) => listItemWidget(() {
                      GoRouter.of(context)
                          .push('/community_town_detail');
                    }))
              ],
            ),
          ),
        ));
  }

  Widget headerWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset('assets/icons/icon_noti.svg',
            width: 28,
            height: 28,
            colorFilter:
                ColorFilter.mode(DaepiroColorStyle.o_400, BlendMode.srcIn)),
        SizedBox(width: 8),
        Expanded(
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).push('/community_rule');
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: DaepiroColorStyle.o_50),
              child: Row(
                children: [
                  SizedBox(width: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text('대피로 커뮤니티 이용수칙',
                        style: DaepiroTextStyle.body_2_m
                            .copyWith(color: DaepiroColorStyle.g_900)),
                  ),
                  Spacer(),
                  SvgPicture.asset('assets/icons/icon_arrow_right.svg',
                      width: 16,
                      height: 16,
                      colorFilter: ColorFilter.mode(
                          DaepiroColorStyle.g_900, BlendMode.srcIn)),
                  SizedBox(width: 12),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  //글 유형 타입 radio button
  Widget typeRadioButton(List<TypeModel> list) {
    return Container(
      height: 36,
      child: ListView.builder(
          itemCount: list.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return new InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                //TODO 상태관리 구축후 탭이벤트 구축
              },
              child: typeItem(list[index]),
            );
          }),
    );
  }

  Widget typeItem(TypeModel _item) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99),
            color: _item.isSelected
                ? DaepiroColorStyle.g_600
                : DaepiroColorStyle.g_50),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
          child: Text(
            _item.text,
            style: _item.isSelected
                ? DaepiroTextStyle.body_1_m.copyWith(color: Colors.white)
                : DaepiroTextStyle.body_1_m
                    .copyWith(color: DaepiroColorStyle.g_600),
          ),
        ),
      ),
    );
  }

  //리스트 아이템 위젯
  Widget listItemWidget(VoidCallback event) {
    return GestureDetector(
      onTap: event,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Visibility(
                    visible: true,
                    child: Column(
                      children: [typeChip(), SizedBox(height: 12)],
                    )),
                Text(
                  '새로운 카페 오픈했네요',
                  style: DaepiroTextStyle.body_1_b
                      .copyWith(color: DaepiroColorStyle.g_900),
                ),
                SizedBox(height: 2),
                Text(
                  '어쩌구저쩌구 바나나푸딩',
                  style: DaepiroTextStyle.body_2_m
                      .copyWith(color: DaepiroColorStyle.g_500),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      '김연지',
                      style: DaepiroTextStyle.caption
                          .copyWith(color: DaepiroColorStyle.g_800),
                    ),
                    SizedBox(width: 2),
                    Visibility(
                      visible: true,
                      child: SvgPicture.asset(
                          'assets/icons/icon_certification.svg',
                          width: 16,
                          height: 16,
                          colorFilter: ColorFilter.mode(
                              DaepiroColorStyle.o_300, BlendMode.srcIn)),
                    ),
                    SizedBox(width: 6),
                    Text('5분전',
                        style: DaepiroTextStyle.caption
                            .copyWith(color: DaepiroColorStyle.g_300)),
                    Spacer(),
                    SvgPicture.asset('assets/icons/icon_good.svg',
                        width: 16,
                        height: 16,
                        colorFilter: ColorFilter.mode(
                            DaepiroColorStyle.g_200, BlendMode.srcIn)),
                    SizedBox(width: 2),
                    Text('1',
                        style: DaepiroTextStyle.caption
                            .copyWith(color: DaepiroColorStyle.g_200)),
                    SizedBox(width: 4),
                    SvgPicture.asset('assets/icons/icon_community.svg',
                        width: 16,
                        height: 16,
                        colorFilter: ColorFilter.mode(
                            DaepiroColorStyle.g_200, BlendMode.srcIn)),
                    SizedBox(width: 2),
                    Text('1',
                        style: DaepiroTextStyle.caption
                            .copyWith(color: DaepiroColorStyle.g_200)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget typeChip() {
    return Container(
      decoration: BoxDecoration(
          color: DaepiroColorStyle.g_50,
          borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        child: Text(
          '일상',
          style:
              DaepiroTextStyle.caption.copyWith(color: DaepiroColorStyle.g_500),
        ),
      ),
    );
  }
}

class TypeModel {
  bool isSelected;
  final String text;

  TypeModel(this.isSelected, this.text);
}
