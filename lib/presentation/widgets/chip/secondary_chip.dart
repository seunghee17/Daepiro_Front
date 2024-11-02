import 'dart:ffi';
import 'package:daepiro/presentation/widgets/DaepiroTheme.dart';
import 'package:flutter/cupertino.dart';

class SecondaryChip extends StatefulWidget {
  final bool isSelected;
  final String text;
  final VoidCallback onPressed;

  const SecondaryChip({
    Key? key,
    required this.isSelected,
    required this.text,
    required this.onPressed
  });

  @override
  State<SecondaryChip> createState() => _SecondaryChipState();
}

class _SecondaryChipState extends State<SecondaryChip> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed();
      },
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
          decoration: BoxDecoration(
            color: widget.isSelected ? DaepiroColorStyle.g_600 : DaepiroColorStyle.g_50,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            widget.text,
            style: DaepiroTextStyle.body_2_b.copyWith(
              color: widget.isSelected ? DaepiroColorStyle.white : DaepiroColorStyle.g_600
            ),
          )
      ),
    );
  }
}
