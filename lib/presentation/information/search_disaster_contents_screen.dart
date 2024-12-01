import 'package:daepiro/presentation/const/nature_disaster_type.dart';
import 'package:daepiro/presentation/information/component/search_disaster_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../widgets/DaepiroTheme.dart';

class SearchDisasterContentsScreen extends StatefulWidget {
  const SearchDisasterContentsScreen({super.key});

  @override
  State<SearchDisasterContentsScreen> createState() => _SearchDisasterContentsScreenState();
}

class _SearchDisasterContentsScreenState extends State<SearchDisasterContentsScreen> {
  List<Map<String, String>> searchedDisasterContentsList = List.empty();

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
                              hintText: "검색어를 입력해주세요.",
                              hintStyle: DaepiroTextStyle.body_1_m.copyWith(
                                color: DaepiroColorStyle.g_200,
                              ),
                            ),
                            onChanged: (text) {
                              setState(() {
                                if (text.isEmpty) {
                                  searchedDisasterContentsList = List.empty();
                                } else {
                                  searchedDisasterContentsList = searchDisasterList(text);
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
                    padding: searchedDisasterContentsList.isNotEmpty ? EdgeInsets.symmetric(horizontal: 12, vertical: 20) : EdgeInsets.all(0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: searchedDisasterContentsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SearchDisasterType(
                          text: searchedDisasterContentsList[index]['type']!,
                          iconPath: searchedDisasterContentsList[index]['icon']!
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
