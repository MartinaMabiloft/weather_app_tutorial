import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/constants/app_colors.dart';
import 'package:weather_app_tutorial/screens/forecast_screen.dart';
import 'package:weather_app_tutorial/screens/search_screen.dart';
import 'package:weather_app_tutorial/screens/weather_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;

  final _destinations = const [
    NavigationDestination(
        icon: Icon(
          Icons.home_outlined,
          color: Colors.white24,
        ),
        selectedIcon: Icon(
          Icons.home,
          color: Colors.white,
        ),
        label: ''),
    NavigationDestination(
        icon: Icon(
          Icons.search_outlined,
          color: Colors.white24,
        ),
        selectedIcon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        label: ''),
    NavigationDestination(
        icon: Icon(
          Icons.wb_sunny_outlined,
          color: Colors.white24,
        ),
        selectedIcon: Icon(
          Icons.wb_sunny,
          color: Colors.white,
        ),
        label: ''),
    NavigationDestination(
        icon: Icon(
          Icons.settings_outlined,
          color: Colors.white24,
        ),
        selectedIcon: Icon(
          Icons.settings,
          color: Colors.white,
        ),
        label: '')
  ];

  final _screens = const [
    // Placeholder(
    //   color: Colors.red,
    // ),
    WeatherScreen(),
    // Placeholder(
    //   color: Colors.green,
    // ),
    SearchScreen(),
    // Placeholder(color: Colors.blue),
    ForecastScreen(),
    Placeholder(color: Colors.yellow)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Home screen'),
      // ),
      body: _screens[_currentPageIndex],

      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          backgroundColor: AppColors.darkBlue,
        ),
        child: NavigationBar(
          destinations: _destinations,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: _currentPageIndex,
          indicatorColor: Colors.transparent,
          indicatorShape: const CircleBorder(),
          onDestinationSelected: (ind) => {
            setState(() {
              _currentPageIndex = ind;
            })
          },
        ),
      ),
    );
  }
}
