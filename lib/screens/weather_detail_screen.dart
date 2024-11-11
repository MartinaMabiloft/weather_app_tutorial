import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_tutorial/constants/app_colors.dart';
import 'package:weather_app_tutorial/constants/text_styles.dart';
import 'package:weather_app_tutorial/extensions/datetime.dart';
import 'package:weather_app_tutorial/extensions/strings.dart';
import 'package:weather_app_tutorial/providers/city_weather_provider.dart';
import 'package:weather_app_tutorial/views/gradient_container.dart';
import 'package:weather_app_tutorial/views/weather_info.dart';

class WeatherDetailScreen extends ConsumerWidget {
  const WeatherDetailScreen({super.key, required this.cityName});

  final String cityName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(cityWeatherProvider(cityName));

    return Material(
      child: weatherData.when(
        data: (weather) {
          return GradientContainer(
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppBar(
                      title: Text(
                        weather.name,
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white),
                      ),
                      backgroundColor: Colors.transparent,
                      leading: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20,
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    DateTime.now().dateTime,
                    style: TextStyles.subtitleText.copyWith(
                        color: Color.alphaBlend(
                            Colors.white.withOpacity(0.3), AppColors.violet)),
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
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white)),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
              WeatherInfo(
                weather: weather,
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          );
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
      ),
    );
  }
}
