import 'package:daepiro/presentation/widgets/DaepiroTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondaryFilledButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final double radius;
  final Widget child;

  const SecondaryFilledButton({
    Key? key,
    required this.onPressed,
    required this.radius,
    required this.child,
  }) : super(key: key);

  @override
  _SecondaryFilledButton createState() => _SecondaryFilledButton();
}

class _SecondaryFilledButton extends State<SecondaryFilledButton> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        overlayColor: DaepiroColorStyle.g_400,
        backgroundColor: DaepiroColorStyle.g_600,
        disabledBackgroundColor: DaepiroColorStyle.g_200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.radius)
        ),
        elevation: 0.0,
        shadowColor: Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: 4)
      ),
        onPressed: widget.onPressed,
        child: widget.child
    );
  }

}