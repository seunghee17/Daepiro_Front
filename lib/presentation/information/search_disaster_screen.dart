import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../widgets/DaepiroTheme.dart';

class SearchDisasterScreen extends StatefulWidget {
  const SearchDisasterScreen({super.key});

  @override
  State<SearchDisasterScreen> createState() => _SearchDisasterScreenState();
}

class _SearchDisasterScreenState extends State<SearchDisasterScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: DaepiroColorStyle.g_50,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20,8,12,8),
                  color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: SvgPicture.asset('assets/icons/arrow_left.svg')
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                          child: TextField(
                            style: DaepiroTextStyle.body_1_m.copyWith(
                              color: DaepiroColorStyle.g_900
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: DaepiroColorStyle.g_50,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8)
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              suffixIcon: Padding(
                                  padding: EdgeInsets.fromLTRB(8, 8, 16, 8),
                                  child: SvgPicture.asset('assets/icons/search.svg')
                              ),
                              suffixIconColor: DaepiroColorStyle.g_200,
                              hintText: "재난명을 입력해주세요.",
                              hintStyle: DaepiroTextStyle.body_1_m.copyWith(
                                color: DaepiroColorStyle.g_200,
                              ),
                            ),
                          )
                      )
                      // Expanded(
                      //   child: Container(
                      //     padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      //     decoration: BoxDecoration(
                      //       color: DaepiroColorStyle.g_50,
                      //       borderRadius: BorderRadius.circular(8)
                      //     ),
                      //     child: Row(
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       children: [
                      //
                      //         SvgPicture.asset(
                      //           'assets/icons/search.svg',
                      //           colorFilter: ColorFilter.mode(DaepiroColorStyle.g_200, BlendMode.srcIn)
                      //         )
                      //       ]
                      //     ),
                      //   ),
                      // )
                    ]
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
