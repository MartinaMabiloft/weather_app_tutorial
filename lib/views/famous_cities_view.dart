import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/models/famous_city.dart';
import 'package:weather_app_tutorial/widgets/famous_city_tile.dart';

class FamousCitiesView extends StatelessWidget {
  const FamousCitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: famousCities.length,
      itemBuilder: (context, index) {
        final city = famousCities[index];

        return FamousCityTile(index: index, city: city.name);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
