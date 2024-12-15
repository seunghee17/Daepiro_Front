import 'package:daepiro/presentation/information/component/disaster_contents_preview_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../cmm/DaepiroTheme.dart';

class DisasterContentsScreen extends StatelessWidget {
  const DisasterContentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: DaepiroColorStyle.white,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: SvgPicture.asset(
                          'assets/icons/icon_arrow_left.svg',
                          alignment: Alignment.centerLeft,
                          colorFilter: ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '재난 콘텐츠',
                          style: DaepiroTextStyle.h6.copyWith(
                            color: DaepiroColorStyle.g_800,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.push('/information/searchDisasterContents');
                        },
                        child: SvgPicture.asset(
                          'assets/icons/icon_search.svg',
                          alignment: Alignment.centerRight,
                          colorFilter: ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1.5, color: DaepiroColorStyle.g_50),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          '최신순',
                          style: DaepiroTextStyle.body_2_m.copyWith(
                            color: DaepiroColorStyle.g_600,
                          )
                      ),
                      const SizedBox(width: 4),
                      SvgPicture.asset(
                        'assets/icons/icon_arrow_down.svg',
                        colorFilter: ColorFilter.mode(DaepiroColorStyle.g_600, BlendMode.srcIn),
                        width: 16,
                        height: 16,
                      ),
                    ],
                  )
                ),
                Divider(height: 1.5, color: DaepiroColorStyle.g_50),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: ListView.builder(
                        itemCount: 7,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return DisasterContentsItem(
                              title: "특별재난지역 선모 당진 면천면, 지난달 집중호우에 12억원 피해${index}",
                              imagePath: 'assets/icons/image_sample.jpg',
                              from: "연합뉴스",
                              date: "2024.08.13",
                              eye: 7,
                              save: 12
                          );
                        }
                    ),
                  ),
                ),
                // Expanded(
                //     child: Container(
                //       width: double.infinity,
                //       color: DaepiroColorStyle.g_50,
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //           SvgPicture.asset('assets/icons/icon_warning_large.svg'),
                //           const SizedBox(height: 4),
                //           Text(
                //             '대피로는 공사중',
                //             style: DaepiroTextStyle.h5.copyWith(
                //               color: DaepiroColorStyle.g_300,
                //             )
                //           ),
                //           const SizedBox(height: 4),
                //           Text(
                //               '행동요령을 파악해 미리 대비해보세요!',
                //               style: DaepiroTextStyle.body_1_m.copyWith(
                //                 color: DaepiroColorStyle.g_300,
                //               )
                //           ),
                //           const SizedBox(height: 20),
                //           GestureDetector(
                //             onTap: () {
                //               context.push('/information/actionTip');
                //             },
                //             child: Container(
                //               padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                //               decoration: BoxDecoration(
                //                 color: DaepiroColorStyle.g_600,
                //                 borderRadius: BorderRadius.circular(99)
                //               ),
                //               child: Row(
                //                 mainAxisSize: MainAxisSize.min,
                //                 crossAxisAlignment: CrossAxisAlignment.center,
                //                 children: [
                //                   Text(
                //                     '행동요령 확인하기',
                //                     style: DaepiroTextStyle.body_2_m.copyWith(
                //                       color: DaepiroColorStyle.white,
                //                     )
                //                   ),
                //                   const SizedBox(width: 4),
                //                   SvgPicture.asset(
                //                       'assets/icons/icon_arrow_right.svg',
                //                     colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                //                   )
                //                 ],
                //               ),
                //             ),
                //           )
                //         ],
                //       ),
                //     )
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
