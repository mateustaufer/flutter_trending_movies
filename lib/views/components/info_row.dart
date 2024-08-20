import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String infoTitle;
  final String info;
  final double fontSize;

  const InfoRow({
    super.key,
    required this.infoTitle,
    required this.info,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          infoTitle,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          info,
          style: TextStyle(fontSize: fontSize),
        ),
      ],
    );
  }
}
