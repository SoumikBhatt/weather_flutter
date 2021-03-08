import 'package:flutter/material.dart';
import 'package:weather_zone/app/routes.dart';
import 'package:weather_zone/app/theme.dart';
import 'package:weather_zone/screens/weather/weather_screen.dart';

class WeatherZoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      routes: routes,
      initialRoute: WeatherScreen.routeName,
    );
  }
}
