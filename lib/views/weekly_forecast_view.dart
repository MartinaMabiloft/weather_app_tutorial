import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_tutorial/constants/app_colors.dart';
import 'package:weather_app_tutorial/constants/text_styles.dart';
import 'package:weather_app_tutorial/providers/weekly_weather_provider.dart';
import 'package:weather_app_tutorial/extensions/datetime.dart';
import 'package:weather_app_tutorial/utils/get_weather_icons.dart';
import 'package:weather_app_tutorial/widgets/subscript_text.dart';

class WeeklyForecastView extends ConsumerWidget {
  const WeeklyForecastView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weeklyForecastData = ref.watch(weeklyWeatherProvider);

    return weeklyForecastData.when(data: (weeklyForecastData) {
      return ListView.builder(
        itemCount: weeklyForecastData.daily.time.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final dayOfTheWeek =
              DateTime.parse(weeklyForecastData.daily.time[index]).dayOfWeek;
          final date = weeklyForecastData.daily.time[index];
          final temperature = weeklyForecastData.daily.temperature2mMax[index];
          final icon = weeklyForecastData.daily.weatherCode[index];

          return WeeklyWeatherTile(
              date: date,
              dayOfTheWeek: dayOfTheWeek,
              icon: getWeatherIcon2(icon),
              temperature: temperature.toDouble());
        },
      );
    }, error: (error, stack) {
      return Center(
          child: Text(
        'Error: $error',
        style: TextStyles.subtitleText,
      ));
    }, loading: () {
      return const Center(child: CircularProgressIndicator());
    });
  }
}

class WeeklyWeatherTile extends StatelessWidget {
  const WeeklyWeatherTile(
      {super.key,
      required this.date,
      required this.dayOfTheWeek,
      required this.temperature,
      required this.icon});

  final String date;
  final String dayOfTheWeek;
  final double temperature;
  final String icon;

  @override
  Widget build(BuildContext context) {
    // String formattedDate = "${date.day}/${date.month}/${date.year}";

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        color: AppColors.accentBlue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(dayOfTheWeek, style: TextStyles.h3),
              const SizedBox(height: 5),
              Text(date, style: TextStyles.subtitleText),
            ],
          ),
          SubscriptText(
              text: temperature.toDouble().toString(), superscriptText: '°C'),
          Image.asset(
            icon,
            width: 50,
          )
        ],
      ),
    );
  }
}
