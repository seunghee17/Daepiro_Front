import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../cmm/DaepiroTheme.dart';
import '../community_view_model.dart';
//동네생활 화면
class CommunityTownScreen extends ConsumerWidget {
  const CommunityTownScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final communityViewModel = ref.watch(communityViewModelProvider);
    return Scaffold(
        body: communityViewModel.when(
            data: (state) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      headerWidget()
                    ],
                  ),
                ),
              );
            },
            error: (error, stack) => Text('에러: ${error}'),
            loading: () => const CircularProgressIndicator())
    );
  }

  Widget headerWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset('assets/icons/icon_noti.svg',
            width: 28,
            height: 28,
            colorFilter: ColorFilter.mode(DaepiroColorStyle.o_400, BlendMode.srcIn)
        ),
        SizedBox(width: 8),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: DaepiroColorStyle.o_50
            ),
            child: Row(
              children: [
                SizedBox(width: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text( '대피로 커뮤니티 이용수칙',
                      style: DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.g_900)
                  ),
                ),
                Spacer(),
                SvgPicture.asset('assets/icons/icon_arrow_right.svg',
                    width: 16,
                    height: 16,
                    colorFilter: ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn)
                ),
                SizedBox(width: 12)
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget listContentWidget(Ref ref) {
    return Container(

    );
  }

  // Widget typeChip(Ref ref) {
  //   Container(
  //     decoration: BoxDecoration(
  //       color: DaepiroColorStyle.g_50,
  //       borderRadius: BorderRadius.circular(4)
  //     ),
  //
  //   );
  // }
}