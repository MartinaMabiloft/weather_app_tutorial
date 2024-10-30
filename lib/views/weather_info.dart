import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/constants/app_colors.dart';
import 'package:weather_app_tutorial/constants/text_styles.dart';
import 'package:weather_app_tutorial/extensions/double.dart';
import 'package:weather_app_tutorial/models/weather.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key, required this.weather});

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
          color: Colors.white12, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WeatherInfoTile(
              title: 'Temperature',
              value:
                  '${weather.main.temp.toStringAsFixed(1).replaceAll('.', ',')}°',
            ),
            WeatherInfoTile(
              title: 'Speed',
              value: '${weather.wind.speed.kmh.replaceAll('.', ',')} km/h',
            ),
            WeatherInfoTile(
              title: 'Humidity',
              value: '${weather.main.humidity}%',
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherInfoTile extends StatelessWidget {
  const WeatherInfoTile({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyles.subtitleText.copyWith(
              color: Color.alphaBlend(
                  Colors.white.withOpacity(0.3), AppColors.violet)),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          value,
          style: const TextStyle(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
