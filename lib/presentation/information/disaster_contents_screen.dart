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
                      SvgPicture.asset(
                        'assets/icons/icon_search.svg',
                        alignment: Alignment.centerRight,
                        colorFilter: ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                      width: double.infinity,
                      color: DaepiroColorStyle.g_50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/icon_warning_large.svg'),
                          const SizedBox(height: 4),
                          Text(
                            '대피로는 공사중',
                            style: DaepiroTextStyle.h5.copyWith(
                              color: DaepiroColorStyle.g_300,
                            )
                          ),
                          const SizedBox(height: 4),
                          Text(
                              '행동요령을 파악해 미리 대비해보세요!',
                              style: DaepiroTextStyle.body_1_m.copyWith(
                                color: DaepiroColorStyle.g_300,
                              )
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              context.push('/information/actionTip');
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                              decoration: BoxDecoration(
                                color: DaepiroColorStyle.g_600,
                                borderRadius: BorderRadius.circular(99)
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '행동요령 확인하기',
                                    style: DaepiroTextStyle.body_2_m.copyWith(
                                      color: DaepiroColorStyle.white,
                                    )
                                  ),
                                  const SizedBox(width: 4),
                                  SvgPicture.asset(
                                      'assets/icons/icon_arrow_right.svg',
                                    colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
