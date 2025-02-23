import 'package:flutter/cupertino.dart';

class EmergencyResponsePageItem extends StatefulWidget {
  final String step;
  final String title;
  final String description;
  final String resource;

  const EmergencyResponsePageItem({
    super.key,
    required this.step,
    required this.title,
    required this.description,
    required this.resource
  });

  @override
  State<EmergencyResponsePageItem> createState() => _EmergencyResponsePageItemState();
}

class _EmergencyResponsePageItemState extends State<EmergencyResponsePageItem> {

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
