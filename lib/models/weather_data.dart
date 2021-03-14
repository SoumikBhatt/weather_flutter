import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherData {
  //weather
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  //main
  final dynamic? temperature;
  final dynamic? minTemperature;
  final dynamic? maxTemperature;
  final dynamic? humidity;

  //wind
  final double? windSpeed;

  //sys
  final int? sunrise;
  final int? sunset;

  final int? time;
  final String? city;
  final int? code;

  WeatherData({
    this.id,
    this.main,
    this.description,
    this.icon,
    this.temperature,
    this.minTemperature,
    this.maxTemperature,
    this.windSpeed,
    this.time,
    this.city,
    this.code,
    this.sunrise,
    this.sunset,
    this.humidity,
  });

  factory WeatherData.fromJson(dynamic json) {
    final weather = json['weather'][0];
    final main = json['main'];
    final wind = json['wind'];
    final sys = json['sys'];
    return WeatherData(
      id: weather['id'],
      main: weather['main'],
      description: weather['description'],
      icon: weather['icon'],
      temperature: main['temp'],
      maxTemperature: main['temp_max'],
      minTemperature: main['temp_min'],
      humidity: main['humidity'],
      windSpeed: wind['speed'],
      sunrise: sys['sunrise'],
      sunset: sys['sunset'],
      time: json['dt'],
      city: json['name'],
      code: json['cod'],
    );
  }

  IconData getIconData() {
    switch (this.icon) {
      case '01d':
        return WeatherIcons.day_sunny;
      case '01n':
        return WeatherIcons.night_clear;
      case '02d':
        return WeatherIcons.day_cloudy_gusts;
      case '02n':
        return WeatherIcons.night_cloudy_gusts;
      case '03d':
      case '04d':
        return WeatherIcons.day_cloudy;
      case '03n':
      case '04n':
        return WeatherIcons.night_clear;
      case '09d':
        return WeatherIcons.day_rain;
      case '09n':
        return WeatherIcons.night_rain;
      case '10d':
        return WeatherIcons.day_rain;
      case '10n':
        return WeatherIcons.night_rain;
      case '11d':
        return WeatherIcons.day_thunderstorm;
      case '11n':
        return WeatherIcons.night_thunderstorm;
      case '13d':
        return WeatherIcons.day_snow;
      case '13n':
        return WeatherIcons.night_snow;
      case '50d':
        return WeatherIcons.day_haze;
      case '50n':
        return WeatherIcons.night_clear;
      default:
        return WeatherIcons.day_sunny;
    }
  }
}
