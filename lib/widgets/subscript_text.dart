import 'package:flutter/material.dart';

class SubscriptText extends StatelessWidget {
  const SubscriptText(
      {super.key, required this.text, required this.superscriptText});

  final String text;
  final String superscriptText;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(
              fontSize: 40, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        Text(superscriptText,
            style: const TextStyle(fontSize: 10, color: Colors.white38)),
      ],
    );
  }
}
