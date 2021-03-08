import 'package:flutter/material.dart';
import 'package:weather_zone/screens/weather/weather_screen.dart';

Map<String,WidgetBuilder> routes = {
  WeatherScreen.routeName : (context) => WeatherScreen(),
};