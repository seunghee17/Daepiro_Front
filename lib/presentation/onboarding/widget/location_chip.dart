import 'package:daepiro/presentation/onboarding/controller/onboarding_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../widgets/DaepiroTheme.dart';

//지역 별명 칩 focusnode 관리로 인해 따로 정의
class LocationChip extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onValidInput;
  final WidgetRef ref;
  late final FocusNode focusNode;

  LocationChip({
    required this.controller,
    required this.onValidInput ,
    required this.ref,
    required this.focusNode
  });

  @override
  _LocationChipState createState() => _LocationChipState();
}

class _LocationChipState extends State<LocationChip> {
  String errorState = 'AVAILABLE';  // 기본 상태

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_validateInput);  // 입력 변화에 따라 상태 검증
    // _focusNode.addListener(() {
    //   setState(() {});  // 포커스 변화에 따른 UI 업데이트
    // });
    widget.focusNode = FocusNode();
  }

  void _validateInput() {
    // 입력 값을 확인하고 유효하면 콜백을 호출하여 부모에서 상태를 변경
    final errorState = widget.ref.read(onboardingViewModelProvider.notifier)
        .checklocationControllerState(widget.controller);

    if (errorState == 'AVAILABLE') {
      widget.onValidInput();
    }
  }

  @override
  void dispose() {
    widget.focusNode.dispose();
    widget.controller.removeListener(_validateInput);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        decoration: BoxDecoration(
          color: widget.focusNode.hasFocus ? DaepiroColorStyle.g_400 : DaepiroColorStyle.g_600,
          borderRadius: BorderRadius.circular(99),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
              child: SvgPicture.asset(
                'assets/icons/icon_location_24.svg',
                colorFilter: ColorFilter.mode(DaepiroColorStyle.white, BlendMode.srcIn),
              ),
            ),
            SizedBox(width: 2),
            Expanded(
              child: TextField(
                focusNode: widget.focusNode,
                cursorWidth: 4,
                cursorColor: DaepiroColorStyle.white,
                controller: widget.controller,
                onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                style: DaepiroTextStyle.body_2_b.copyWith(color: DaepiroColorStyle.white),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
