
import 'package:flutter/material.dart';

import '../DaepiroTheme.dart';

class SecondaryLightButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final double radius;
  final Widget child;
  final double padding;

  const SecondaryLightButton({
    super.key,
    required this.onPressed,
    required this.radius,
    required this.child,
    required this.padding
  });

  @override
  _SecondaryLightButton createState() => _SecondaryLightButton();
}

class _SecondaryLightButton extends State<SecondaryLightButton> {
  @override
  Widget build(BuildContext context) {
   return ElevatedButton(
     style: ElevatedButton.styleFrom(
       backgroundColor: DaepiroColorStyle.g_50,
       disabledBackgroundColor: DaepiroColorStyle.g_50,
       shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(widget.radius)
       ),
       elevation: 0.0,
       shadowColor: Colors.transparent,
         padding: EdgeInsets.symmetric(vertical: widget.padding)
     ).copyWith(
       backgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
         if (states.contains(WidgetState.pressed)) {
           return DaepiroColorStyle.g_75;
         }
         return DaepiroColorStyle.g_50;
       }),
     ),
       onPressed: widget.onPressed,
       child: widget.child
   );
  }

}