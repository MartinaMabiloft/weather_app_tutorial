import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_tutorial/constants/app_colors.dart';
import 'package:weather_app_tutorial/constants/text_styles.dart';
import 'package:weather_app_tutorial/extensions/strings.dart';
import 'package:weather_app_tutorial/providers/city_weather_provider.dart';
import 'package:weather_app_tutorial/utils/get_weather_icons.dart';

class FamousCityTile extends ConsumerWidget {
  const FamousCityTile({super.key, required this.index, required this.city});

  final int index;
  final String city;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(cityWeatherProvider(city));

    return weatherData.when(
      data: (data) => Material(
        color: index == 0 ? AppColors.lightBlue : AppColors.accentBlue,
        elevation: index == 0 ? 3 : 0,
        borderRadius: BorderRadius.circular(25),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${data.main.temp.toDouble().toStringAsFixed(0)}°C',
                              style: TextStyles.h3,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              data.weather.first.description.capitalize,
                              style: TextStyles.subtitleText,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            )
                          ]),
                    ),
                    const SizedBox(width: 5),
                    Image.asset(
                      getWeatherIcon(weatherCode: data.weather[0].id),
                      width: 50,
                    )
                  ],
                ),
                Text(city,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ],
            )),
      ),
      error: (error, stackTrace) => Material(
          color: index == 0 ? AppColors.lightBlue : AppColors.accentBlue,
          elevation: index == 0 ? 3 : 0,
          borderRadius: BorderRadius.circular(25),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(error.toString(), style: TextStyles.subtitleText),
                Text(city,
                    style: const TextStyle(fontSize: 18, color: Colors.white)),
              ],
            ),
          )),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
