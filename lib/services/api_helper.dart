import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show immutable;

import '/constants/constants.dart';
import '/models/hourly_weather.dart';
import '/models/weather.dart';
import '/models/weekly_weather.dart';
import '/services/geolocator.dart';
import '/utils/logging.dart';

@immutable
class ApiHelper {
  static const baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const weeklyWeatherUrl =
      'https://api.open-meteo.com/v1/forecast?current=&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=auto';
  static double lat = 0.0;
  static double lon = 0.0;
  static final dio = Dio();

// Get latitude and longitude
  static Future<void> fetchLocation() async {
    final location = await getLocation();
    lat = location.latitude;
    lon = location.longitude;
  }

// * current weather
  static Future<Weather> getCurrentWeather() async {
    await fetchLocation();
    final url = _constructWeatherUrl();
    final data = await _fetchData(url);
    return Weather.fromJson(data);
  }

  // * hourly forecast
  static Future<HourlyWeather> getHourlyForecast() async {
    await fetchLocation();
    final url = _constructForecastUrl();
    final data = await _fetchData(url);
    return HourlyWeather.fromJson(data);
  }

// * weekly forecast
  static Future<WeeklyWeather> getWeeklyForecast() async {
    await fetchLocation();
    final url = _constructWeeklyForecastUrl();
    final data = await _fetchData(url);
    return WeeklyWeather.fromJson(data);
  }

// * weather by city
  static Future<Weather> getWeatherByCity({required String cityname}) async {
    final url = _constructWeatherByCityUrl(cityname: cityname);
    final data = await _fetchData(url);
    return Weather.fromJson(data);
  }

// Build urls
  static String _constructWeatherUrl() {
    return '$baseUrl/weather?lat=$lat&lon=$lon&units=metric&appid=${Constants.apiKey}';
  }

  static String _constructForecastUrl() {
    return '$baseUrl/forecast?lat=$lat&lon=$lon&units=metric&appid=${Constants.apiKey}';
  }

  static String _constructWeatherByCityUrl({required String cityname}) {
    return '$baseUrl/weather?q=$cityname&units=metric&appid=${Constants.apiKey}';
  }

  static String _constructWeeklyForecastUrl() {
    return '$weeklyWeatherUrl&latitude=$lat&longitude=$lon';
  }

// Fetch data
  static Future<Map<String, dynamic>> _fetchData(String url) async {
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        printWarning('Error fetching data from $url');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      printWarning('Error fetching data from $url');
      throw Exception(e);
    }
  }
}
