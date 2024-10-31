import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_tutorial/constants/app_colors.dart';
import 'package:weather_app_tutorial/constants/text_styles.dart';
import 'package:weather_app_tutorial/extensions/int.dart';
import 'package:weather_app_tutorial/providers/hourly_weather_provider.dart';
import 'package:weather_app_tutorial/utils/get_weather_icons.dart';

class HourlyForecastView extends ConsumerWidget {
  const HourlyForecastView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hourlyWeatherData = ref.watch(hourlyWeatherProvider);

    return hourlyWeatherData.when(data: (hourlyWeather) {
      return SizedBox(
        height: 100,
        child: ListView.builder(
          itemCount: hourlyWeather.cnt,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, ind) {
            final forecast = hourlyWeather.list[ind];

            return HourlyWeatherTile(
              id: forecast.weather[0].id,
              hour: forecast.dt.time,
              temp: forecast.main.temp.toStringAsFixed(1).replaceAll('.', ','),
              isActive: ind == 0,
            );
          },
        ),
      );
    }, error: (error, stackTrace) {
      return Center(child: Text(error.toString()));
    }, loading: () {
      return const Center(child: CircularProgressIndicator());
    });
  }
}

class HourlyWeatherTile extends StatelessWidget {
  const HourlyWeatherTile(
      {super.key,
      required this.id,
      required this.hour,
      required this.temp,
      required this.isActive});

  final int id;
  final String hour;
  final String temp;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Material(
        color: isActive ? AppColors.lightBlue : AppColors.accentBlue,
        borderRadius: BorderRadius.circular(10),
        elevation: isActive ? 4 : 2,
        // animationDuration: const Duration(milliseconds: 300),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                getWeatherIcon(weatherCode: id),
                width: 35,
              ),
              const SizedBox(width: 5),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    hour,
                    style: TextStyles.subtitleText.copyWith(
                      color: isActive ? AppColors.white : Colors.white54,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('$temp°', style: TextStyles.h3.copyWith()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
