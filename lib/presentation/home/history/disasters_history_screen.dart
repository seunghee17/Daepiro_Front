import 'package:daepiro/data/model/response/home/disasters_history_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../cmm/DaepiroTheme.dart';
import '../../../cmm/chip/secondary_chip.dart';
import '../component/disaster_history_item.dart';
import '../main/home_view_model.dart';

class DisastersHistoryScreen extends ConsumerStatefulWidget {
  const DisastersHistoryScreen({super.key});

  @override
  _DisasterMessageHistoryScreen createState() => _DisasterMessageHistoryScreen();
}

class _DisasterMessageHistoryScreen extends ConsumerState<DisastersHistoryScreen> {

  @override
  void initState() {
    super.initState();
    ref.read(homeStateNotifierProvider.notifier).getDisastersHistory();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(homeStateNotifierProvider);

    return Scaffold(
        body: SafeArea(
          child: Container(
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
                          child: SvgPicture.asset(
                            'assets/icons/icon_arrow_left.svg',
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 14),
                        alignment: Alignment.center,
                        child: Text(
                          "재난문자 내역",
                          style: DaepiroTextStyle.h6.copyWith(
                            color: DaepiroColorStyle.g_800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 4, 0, 0),
                    child: Row(
                      children: [
                        for (int i=0;i<viewModel.disastersList.length;i++)
                          Row(
                            children: [
                              SecondaryChip(
                                  isSelected: i == viewModel.selectedDisasterHistoryType,
                                  text: viewModel.disastersList[i].region ?? "",
                                  onPressed: () {
                                    ref.read(homeStateNotifierProvider.notifier).selectDisasterHistoryType(i);
                                  }
                              ),
                              const SizedBox(width: 8)
                            ],
                          )
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListView.builder(
                          itemCount: viewModel.disastersList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: viewModel.disastersList[viewModel.selectedDisasterHistoryType].disasters?.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      DisasterHistoryItem(
                                        icon: viewModel.disastersList[viewModel.selectedDisasterHistoryType].disasters?[index].disasterType ?? "",
                                        title: viewModel.disastersList[viewModel.selectedDisasterHistoryType].disasters?[index].title ?? "",
                                        contents: viewModel.disastersList[viewModel.selectedDisasterHistoryType].disasters?[index].content ?? "",
                                        date: viewModel.disastersList[viewModel.selectedDisasterHistoryType].disasters?[index].time ?? "",
                                        isVisibleDate: index == 0
                                            ? true
                                            : index != 0 && (
                                            viewModel.disastersList[viewModel.selectedDisasterHistoryType].disasters?[index].time?.split("T")[0]
                                                != viewModel.disastersList[viewModel.selectedDisasterHistoryType].disasters?[index-1].time?.split("T")[0]
                                        ),
                                        onClick: () {
                                          context.push(
                                              '/home/disasterDetail',
                                              extra: Disasters(
                                                disasterType: viewModel.disastersList[viewModel.selectedDisasterHistoryType].disasters?[index].disasterType,
                                                disasterTypeId: viewModel.disastersList[viewModel.selectedDisasterHistoryType].disasters?[index].disasterTypeId,
                                                title: viewModel.disastersList[viewModel.selectedDisasterHistoryType].disasters?[index].title,
                                                content: viewModel.disastersList[viewModel.selectedDisasterHistoryType].disasters?[index].content,
                                                time: viewModel.disastersList[viewModel.selectedDisasterHistoryType].disasters?[index].time,
                                              )
                                          );
                                        },
                                      ),
                                      const SizedBox(height: 8),
                                    ],
                                  );
                                }
                            );
                          },
                        ),
                      )
                  )
                ],
              )
          ),
        )
    );
  }
}
