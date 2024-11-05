import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/constants/app_colors.dart';

class LocationIcon extends StatelessWidget {
  const LocationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.violet,
      ),
      child: const Icon(Icons.location_on, color: Colors.white),
    );
  }
}
