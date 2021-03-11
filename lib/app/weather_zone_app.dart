import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_zone/app/routes.dart';
import 'package:weather_zone/app/theme.dart';
import 'package:weather_zone/backend/api_service.dart';
import 'package:weather_zone/screens/weather/weather_screen.dart';

class WeatherZoneApp extends StatelessWidget {
  final ApiService apiService;

  const WeatherZoneApp({Key? key, required this.apiService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: apiService,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        routes: routes,
        initialRoute: WeatherScreen.routeName,
      ),
    );
  }
}
