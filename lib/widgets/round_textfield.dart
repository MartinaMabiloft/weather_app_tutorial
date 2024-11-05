import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/constants/app_colors.dart';

class RoundTextField extends StatelessWidget {
  const RoundTextField({super.key, required this.controller});

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.2),
      ),
      child: TextField(
        controller: controller,
        textAlignVertical: TextAlignVertical.top,
        style:
            const TextStyle(color: Colors.white), // è il colore in cui scrivo
        decoration: InputDecoration(
            hintText: 'Search location',
            hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.5)), // colore del placeholder
            fillColor: AppColors.violet, // colore del cursore e della linea
            focusColor: Colors.amber, // boh
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 2)),
      ),
    );
  }
}
