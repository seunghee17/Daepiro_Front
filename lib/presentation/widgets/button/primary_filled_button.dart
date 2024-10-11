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
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.onPressed == null
            ? widget.disabledColor
            : widget.backgroundColor,
        disabledBackgroundColor: widget.disabledColor ?? widget.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        elevation: 1.0,
        shadowColor: DaepiroColorStyle.black.withOpacity(0.15),
        padding: EdgeInsets.symmetric(vertical: widget.verticalPadding),
      ).copyWith(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return widget.pressedColor;
            }
            return widget.backgroundColor;
          },
        ),
      ),
      onPressed: widget.onPressed,
      child: widget.child,
    );
  }
}

