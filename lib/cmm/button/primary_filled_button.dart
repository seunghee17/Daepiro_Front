import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../DaepiroTheme.dart';

class PrimaryFilledButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color pressedColor;
  final double borderRadius;
  final Color? disabledColor;
  final Widget child;
  final double verticalPadding;

  const PrimaryFilledButton({
    Key? key,
    this.onPressed,
    required this.backgroundColor,
    required this.pressedColor,
    required this.borderRadius,
    this.disabledColor,
    required this.child,
    required this.verticalPadding
  }) : super(key: key);

  @override
  _PrimaryFilledButton createState() => _PrimaryFilledButton();
}

class _PrimaryFilledButton extends State<PrimaryFilledButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        ),
        elevation: MaterialStateProperty.all(1.0),
        shadowColor: MaterialStateProperty.all(DaepiroColorStyle.black.withOpacity(0.15)),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: widget.verticalPadding),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return widget.disabledColor ?? widget.backgroundColor;  // 비활성화 상태 색상
            }
            if (states.contains(MaterialState.pressed)) {
              return widget.pressedColor;  // 눌렀을 때의 색상
            }
            return widget.backgroundColor;  // 기본 색상
          },
        ),
      ),
      onPressed: widget.onPressed,
      child: widget.child,
    );
  }
}

