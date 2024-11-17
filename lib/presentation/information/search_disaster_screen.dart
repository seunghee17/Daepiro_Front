import 'package:daepiro/presentation/const/nature_disaster_type.dart';
import 'package:daepiro/presentation/information/component/search_disaster_type.dart';
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
  List<Map<String, String>> searchedDisasterList = List.empty();

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
                        child: SvgPicture.asset('assets/icons/icon_arrow_left.svg')
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
                                  child: SvgPicture.asset('assets/icons/icon_search.svg')
                              ),
                              suffixIconColor: DaepiroColorStyle.g_200,
                              hintText: "재난명을 입력해주세요.",
                              hintStyle: DaepiroTextStyle.body_1_m.copyWith(
                                color: DaepiroColorStyle.g_200,
                              ),
                            ),
                            onChanged: (text) {
                              setState(() {
                                if (text.isEmpty) {
                                  searchedDisasterList = List.empty();
                                } else {
                                  searchedDisasterList = searchDisasterList(text);
                                }
                              });
                            },
                          )
                      )
                    ]
                  ),
                ),
                Flexible(
                  child: Container(
                    color: Colors.white,
                    padding: searchedDisasterList.isNotEmpty ? EdgeInsets.symmetric(horizontal: 12, vertical: 20) : EdgeInsets.all(0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: searchedDisasterList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SearchDisasterType(
                          text: searchedDisasterList[index]['type']!,
                          iconPath: searchedDisasterList[index]['icon']!
                        );
                      }
                    )
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

List<Map<String, String>> searchDisasterList(String text) {
  return NatureDisasterList.where((item) {
    return item['type']!.contains(text);
  }).toList();
}
