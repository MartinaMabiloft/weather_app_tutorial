import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_tutorial/constants/app_colors.dart';
import 'package:weather_app_tutorial/constants/text_styles.dart';
import 'package:weather_app_tutorial/extensions/datetime.dart';
import 'package:weather_app_tutorial/extensions/strings.dart';
import 'package:weather_app_tutorial/providers/current_weather_provider.dart';
import 'package:weather_app_tutorial/views/gradient_container.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(currentWeatherProvider);

    return weatherData.when(
      data: (weather) {
        return GradientContainer(children: [
          const SizedBox(
            width: double.infinity,
            // height: 30,
            // child: Container(
            //   decoration: BoxDecoration(
            //       color: Colors.white12,
            //       borderRadius: BorderRadius.circular(10)),
            // ),
          ),
          Text(
            weather.name,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            DateTime.now().dateTime,
            style: TextStyles.subtitleText,
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 260,
            child: Image.asset(
                'assets/icons/${weather.weather[0].icon.replaceAll('n', 'd')}.png',
                fit: BoxFit.contain),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(weather.weather[0].description.capitalize,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white)),
        ]);
      },
      loading: () {
        return const GradientContainer(
            children: [Center(child: CircularProgressIndicator())]);
      },
      error: (error, stack) {
        return GradientContainer(
          children: [
            Center(
                child: Text(
              error.toString(),
              style: const TextStyle(color: Colors.green),
            ))
          ],
        );
      },
    );
  }
}
