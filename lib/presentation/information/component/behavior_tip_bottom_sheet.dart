import 'package:daepiro/data/model/response/information/behavior_list_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../cmm/DaepiroTheme.dart';
import '../../../cmm/chip/secondary_chip.dart';
import '../../home/component/action_tip_item.dart';

class BehaviorTipBottomSheet extends StatefulWidget {
  final Behavior behavior;

  const BehaviorTipBottomSheet({
    super.key,
    required this.behavior
  });

  @override
  State<BehaviorTipBottomSheet> createState() => _BehaviorTipBottomSheetState();
}

class _BehaviorTipBottomSheetState extends State<BehaviorTipBottomSheet> {
  int selectedDisasterTypeIdx = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
      child: Container(
        width: double.infinity,
        color: DaepiroColorStyle.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                        widget.behavior.name ?? "",
                        style: DaepiroTextStyle.body_1_b.copyWith(
                          color: DaepiroColorStyle.g_900,
                        )
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        'assets/icons/icon_close.svg',
                        colorFilter: const ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1,color: DaepiroColorStyle.g_50),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      for (int i=0;i<widget.behavior.tips!.length;i++)
                        Row(
                          children: [
                            const SizedBox(width: 8),
                            SecondaryChip(
                                isSelected: selectedDisasterTypeIdx == i,
                                text: widget.behavior.tips![i].filter ?? "",
                                onPressed: () {
                                  setState(() {
                                    selectedDisasterTypeIdx = i;
                                  });
                                }
                            ),
                          ],
                        )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 16),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.behavior.tips?[selectedDisasterTypeIdx].tips?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return ActionTipItem(
                            text: widget.behavior.tips?[selectedDisasterTypeIdx].tips?[index] ?? ""
                        );
                      }
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

