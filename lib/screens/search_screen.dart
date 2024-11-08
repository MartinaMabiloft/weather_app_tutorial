import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/constants/text_styles.dart';
import 'package:weather_app_tutorial/views/famous_cities_view.dart';
import 'package:weather_app_tutorial/views/gradient_container.dart';
import 'package:weather_app_tutorial/widgets/location_icon.dart';
import 'package:weather_app_tutorial/widgets/round_textfield.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Pick location",
              style: TextStyles.h1,
            ),
            SizedBox(height: 16),
            Text(
              "Find the area you want to know the detailed information about",
              style: TextStyles.subtitleText,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            Expanded(
              child: RoundTextField(
                controller: _controller,
              ),
            ),
            const SizedBox(width: 10),
            const LocationIcon()
          ],
        ),
        const SizedBox(height: 30),
        const FamousCitiesView(),
        const SizedBox(height: 30),
      ]),
    );
  }
}
