import 'package:daepiro/presentation/const/emergency_disaster_list.dart';
import 'package:daepiro/presentation/information/component/search_disaster_type.dart';
import 'package:daepiro/presentation/information/contents/search/search_disaster_contents_state.dart';
import 'package:daepiro/presentation/information/contents/search/search_disaster_contents_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../cmm/DaepiroTheme.dart';
import '../../component/disaster_contents_preview_item.dart';

class SearchDisasterContentsScreen extends ConsumerWidget {
  const SearchDisasterContentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(searchDisasterContentsStateNotifierProvider);
    List<Map<String, String>> searchedDisasterContentsList = List.empty();
    var search = "";
아 잠만
    ref.listen<SearchDisasterContentsState>(searchDisasterContentsStateNotifierProvider, (previous, next) {
      if (next.isLoading) {

      }
    });

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
                              context.pop(context);
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
                                    child: GestureDetector(
                                      onTap: () {
                                        ref.read(searchDisasterContentsStateNotifierProvider.notifier)
                                            .searchDisasterContents(keyword: search);
                                      },
                                      child: SvgPicture.asset('assets/icons/icon_search.svg')
                                    )
                                ),
                                suffixIconColor: DaepiroColorStyle.g_200,
                                hintText: "검색어를 입력해주세요.",
                                hintStyle: DaepiroTextStyle.body_1_m.copyWith(
                                  color: DaepiroColorStyle.g_200,
                                ),
                              ),
                              onChanged: (text) {
                                search = text;
                                if (text.isEmpty) {
                                  searchedDisasterContentsList = List.empty();
                                } else {
                                  searchedDisasterContentsList = searchDisasterList(text);
                                }
                              },
                            )
                        )
                      ]
                  ),
                ),
                Flexible(
                  child: Container(
                      color: Colors.white,
                      padding: viewModel.searchedContentsList.isNotEmpty ? EdgeInsets.symmetric(horizontal: 12, vertical: 20) : EdgeInsets.all(0),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: viewModel.searchedContentsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return DisasterContentsItem(
                                title: viewModel.searchedContentsList[index].title ?? "",
                                imagePath: viewModel.searchedContentsList[index].thumbnailUrl ?? "",
                                from: viewModel.searchedContentsList[index].source ?? "",
                                date: viewModel.searchedContentsList[index].publishedAt ?? "",
                                eye: viewModel.searchedContentsList[index].viewCount ?? 0,
                                save: viewModel.searchedContentsList[index].likeCount ?? 0
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
  return EmergencyDisasterList.where((item) {
    return item['name']!.contains(text);
  }).toList();
}
