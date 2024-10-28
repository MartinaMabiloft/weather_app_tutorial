import 'package:flutter/material.dart';
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
        icon: Icon(Icons.home_outlined),
        selectedIcon: Icon(Icons.home),
        label: ''),
    NavigationDestination(
        icon: Icon(Icons.search_outlined),
        selectedIcon: Icon(Icons.search),
        label: ''),
    NavigationDestination(
        icon: Icon(Icons.wb_sunny_outlined),
        selectedIcon: Icon(Icons.wb_sunny),
        label: ''),
    NavigationDestination(
        icon: Icon(Icons.settings_outlined),
        selectedIcon: Icon(Icons.settings),
        label: '')
  ];

  final _screens = const [
    // Placeholder(
    //   color: Colors.red,
    // ),
    WeatherScreen(),
    Placeholder(
      color: Colors.green,
    ),
    Placeholder(color: Colors.blue),
    Placeholder(color: Colors.yellow)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home screen'),
      ),
      body: _screens[_currentPageIndex],
      bottomNavigationBar: NavigationBar(
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
    );
  }
}
