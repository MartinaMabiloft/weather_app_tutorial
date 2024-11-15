import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/constants/text_styles.dart';
import 'package:weather_app_tutorial/views/gradient_container.dart';
import 'package:weather_app_tutorial/views/hourly_forecast_view.dart';
import 'package:weather_app_tutorial/views/weekly_forecast_view.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    String formattedDate = "${date.day}/${date.month}/${date.year}";

    return Scaffold(
        body: GradientContainer(children: [
      const Center(child: Text('Forecast report', style: TextStyles.h1)),
      const SizedBox(height: 20),
      SizedBox(
        height: 40,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Today', style: TextStyles.h2),
            Text(formattedDate, style: TextStyles.subtitleText),
          ],
        ),
      ),
      const SizedBox(height: 20),
      const HourlyForecastView(),
      const SizedBox(height: 20),
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Next Forecast', style: TextStyles.h2),
          Icon(Icons.calendar_month_outlined, color: Colors.white),
        ],
      ),
      const SizedBox(height: 20),
      WeeklyForecastView(),
    ]));
  }
}
