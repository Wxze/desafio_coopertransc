import 'package:flutter/material.dart';

class CardField extends StatelessWidget {
  final String label;
  final String value;
  final double? fontSize;

  const CardField({
    Key? key,
    required this.label,
    required this.value,
    this.fontSize
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            )),
        Text(value,
            style: TextStyle(
              color: const Color(0xFF000D0C),
              fontSize: fontSize ?? 14,
            ))
      ],
    );
  }
}