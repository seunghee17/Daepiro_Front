import 'package:daepiro/presentation/widgets/DaepiroTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../home/component/action_tip_item.dart';
import '../../widgets/chip/secondary_chip.dart';

class ActionTipBottomSheet extends StatefulWidget {
  final String disasterType;

  const ActionTipBottomSheet({
    Key? key,
    required this.disasterType
  }): super(key: key);

  @override
  State<ActionTipBottomSheet> createState() => _ActionTipBottomSheetState();
}

class _ActionTipBottomSheetState extends State<ActionTipBottomSheet> {
  String selectedCategory = "실내";

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
              padding: EdgeInsets.all(16),
              child: Stack(
                children: [
                  Align(
                    child: Text(
                        widget.disasterType,
                        style: DaepiroTextStyle.body_1_b.copyWith(
                          color: DaepiroColorStyle.g_900,
                        )
                    ),
                    alignment: Alignment.center,
                  ),
                  Align(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        'assets/icons/icon_close.svg',
                        colorFilter: ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn),
                      ),
                    ),
                    alignment: Alignment.centerRight,
                  ),
                ],
              ),
            ),
            Divider(height: 1,color: DaepiroColorStyle.g_50),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 8),
                      SecondaryChip(
                          isSelected: selectedCategory == "실내",
                          text: "실내",
                          onPressed: () {
                            setState(() {
                              selectedCategory = "실내";
                            });
                          }
                      ),
                      const SizedBox(width: 8),
                      SecondaryChip(
                          isSelected: selectedCategory == "실외",
                          text: "실외",
                          onPressed: () {
                            setState(() {
                              selectedCategory = "실외";
                            });
                          }
                      ),
                      const SizedBox(width: 8),
                      SecondaryChip(
                          isSelected: selectedCategory == "기타",
                          text: "기타",
                          onPressed: () {
                            setState(() {
                              selectedCategory = "기타";
                            });
                          }
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 16),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return ActionTipItem(
                            isSelected: true,
                            text: "튼튼한 탁자 아래에 들어가 몸을 보호하세용..${index}"
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

