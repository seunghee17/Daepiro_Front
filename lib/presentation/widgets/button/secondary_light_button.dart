import 'package:daepiro/presentation/widgets/DaepiroTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondaryLightButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final double radius;
  final Widget child;

  const SecondaryLightButton({
    Key? key,
    required this.onPressed,
    required this.radius,
    required this.child,
  }) : super(key: key);

  @override
  _SecondaryLightButton createState() => _SecondaryLightButton();
}

class _SecondaryLightButton extends State<SecondaryLightButton> {
  @override
  Widget build(BuildContext context) {
   return ElevatedButton(
     style: ElevatedButton.styleFrom(
       overlayColor: DaepiroColorStyle.g_75,
       backgroundColor: DaepiroColorStyle.g_50,
       disabledBackgroundColor: DaepiroColorStyle.g_50,
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