import 'package:flutter/material.dart';

class CardIconField extends StatelessWidget {
  final String label;
  final double? fontSize;
  final IconData icon;
  final String firstValue;
  final String secondValue;

  const CardIconField(
      {Key? key,
      required this.label,
      required this.icon,
      required this.firstValue,
      required this.secondValue,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Flexible(
              child: Text(
                firstValue,
                style: TextStyle(
                  color: const Color(0xFF000D0C),
                  fontSize: fontSize ?? 14,
                ),
              ),
            ),
            const SizedBox(width: 12,),
            Icon(
              icon,
              size: fontSize ?? 14,
            ),
            const SizedBox(width: 12,),
            Flexible(
              child: Text(
                secondValue,
                style: TextStyle(
                  color: const Color(0xFF000D0C),
                  fontSize: fontSize ?? 14,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
