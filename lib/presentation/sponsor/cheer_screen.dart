import 'package:daepiro/presentation/const/utils.dart';
import 'package:daepiro/presentation/sponsor/component/item_cheer_comment.dart';
import 'package:daepiro/presentation/sponsor/sponsor_state.dart';
import 'package:daepiro/presentation/sponsor/sponsor_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../cmm/DaepiroTheme.dart';
import 'component/item_sponsor_preview.dart';

class CheerScreen extends ConsumerWidget {
  CheerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(sponsorStateNotifierProvider);

    ref.listen<SponsorState>(sponsorStateNotifierProvider, (previous, next) {

    });

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: DaepiroColorStyle.white,
            child: Column(
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(top: 4, bottom: 4, left: 12),
                          child: SvgPicture.asset('assets/icons/icon_arrow_left.svg'),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 14),
                        alignment: Alignment.center,
                        child: Text(
                          "응원의 한마디",
                          style: DaepiroTextStyle.h6.copyWith(
                            color: DaepiroColorStyle.g_800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/image_sample.jpg',
                        width: 178,
                        height: 178,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "응원이 필요한 이웃에게\n따뜻한 한마디를 전달해보세요",
                        style: DaepiroTextStyle.h6.copyWith(
                          color: DaepiroColorStyle.g_900,
                        ),
                        textAlign: TextAlign.center
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "메시지는 후원 페이지 상단 배너에 노출돼요.",
                        style: DaepiroTextStyle.body_2_m.copyWith(
                          color: DaepiroColorStyle.g_400,
                        ),
                        textAlign: TextAlign.center
                      ),
                      const SizedBox(height: 28),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: viewModel.cheerCommentList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: ItemCheerComment(
                                    name: viewModel.cheerCommentList[index].author ?? "",
                                    date: viewModel.cheerCommentList[index].time ?? "",
                                    contents: viewModel.cheerCommentList[index].content ?? "",
                                ),
                              ),
                              const SizedBox(height: 12)
                            ],
                          );
                        }
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: DaepiroColorStyle.g_50,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                    decoration: BoxDecoration(
                        color: DaepiroColorStyle.g_50,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextField(
                            maxLength: 10,
                            style: DaepiroTextStyle.body_2_m.copyWith(
                              color: DaepiroColorStyle.g_900,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: DaepiroColorStyle.g_50,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              hintText: "여러분의 메시지를 전해보세요.(최대 10자)",
                              hintStyle: DaepiroTextStyle.body_2_m.copyWith(
                                color: DaepiroColorStyle.g_200,
                              ),
                              counterText: ""
                            ),
                            onChanged: (text) {

                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        GestureDetector(
                          onTap: () {

                          },
                          child: Container(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text(
                              "등록",
                              style: DaepiroTextStyle.body_2_m.copyWith(
                                color: DaepiroColorStyle.g_600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]
            ),
          ),
        ),
      ),
    );
  }
}