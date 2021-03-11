import 'package:flutter/material.dart';
import 'package:weather_zone/app/weather_zone_app.dart';
import 'package:weather_zone/backend/api_service.dart';
import 'package:weather_zone/utils/constants.dart';

void main() {
  final apiService = ApiService(BASE_URL);
  runApp(WeatherZoneApp(apiService: apiService,));
}
