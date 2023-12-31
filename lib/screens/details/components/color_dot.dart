import 'package:e_console_store/constants/constants.dart';
import 'package:flutter/material.dart';

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding / 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        radius: 10,
        backgroundColor: color,
      ),
    );
  }
}
