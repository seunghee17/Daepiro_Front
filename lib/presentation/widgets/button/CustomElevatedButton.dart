import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color pressedColor;
  final double radius;
  final Widget child;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.backgroundColor,
    required this.pressedColor,
    required this.radius,
    required this.child
  }) : super(key: key);

  @override
  _CustomElevatedButtonState createState() => _CustomElevatedButtonState();
}

  class _CustomElevatedButtonState extends State<CustomElevatedButton> {
    bool isPressed = false;
    @override
    Widget build(BuildContext context) {
      return ElevatedButton(
          style: ElevatedButton.styleFrom(
            overlayColor: widget.pressedColor,
            backgroundColor: widget.backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.radius)
            ),

          ),
          onPressed: widget.onPressed,
          child: widget.child
      );
    }
  }

