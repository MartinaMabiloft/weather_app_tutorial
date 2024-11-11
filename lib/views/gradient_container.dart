import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/constants/app_colors.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height,
      width: screenSize.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.black,
              AppColors.darkBlue,
              AppColors.accentBlue,
              // AppColors.lightBlue,
              AppColors.violet,
            ]),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 60),
        child: CustomScrollView(
          slivers: [SliverList(delegate: SliverChildListDelegate(children))],
        ),
      ),
    );
  }
}
