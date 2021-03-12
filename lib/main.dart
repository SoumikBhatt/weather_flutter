import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_zone/app/dark_theme_provider.dart';
import 'package:weather_zone/app/weather_zone_app.dart';
import 'package:weather_zone/backend/api_service.dart';
import 'package:weather_zone/utils/constants.dart';

void main() {
  final apiService = ApiService(BASE_URL);
  runApp(
    ChangeNotifierProvider(
      create: (_) => DarkThemeProvider(),
      child: WeatherZoneApp(
        apiService: apiService,
      ),
    ),
  );
}
