import 'dart:convert';

import 'package:weather_zone/models/weather_data.dart';
import 'package:weather_zone/utils/constants.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<WeatherData?> fetchCurrentWeather(String? lat, String? lon) async {

    final Map<String,dynamic>? queries = {
      'lat': lat,
      'lon': lon,
      'appid': APP_ID,
      'units': 'metric',
    };

    final response = await http.get(Uri.https(
      baseUrl,
      '/data/2.5/weather',queries
    ));


    if (response.statusCode == 200) {
      print('ApiService.fetchCurrentWeather: Success: ${response.body}');
      return WeatherData.fromJson(json.decode(response.body));
    } else {
      print(
          'ApiService.fetchCurrentWeather: Exception: ${response.statusCode}');
      throw Exception('Failed to fetch weather info');
    }
  }
}