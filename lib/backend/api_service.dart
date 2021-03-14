import 'dart:convert';

import 'package:location/location.dart';
import 'package:weather_zone/app/dark_theme_provider.dart';
import 'package:weather_zone/models/weather_data.dart';
import 'package:weather_zone/utils/constants.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  Location location = Location();

  DarkThemeProvider darkThemeProvider = DarkThemeProvider();

  ApiService(this.baseUrl);

  Future<WeatherData?> fetchCurrentWeather() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        print('_BodyState._getLocation: Location Service not enabled');
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();

    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        print('_BodyState._getLocation: Permission denied');
        return null;
      }
    }

    LocationData locationData = await location.getLocation();

    print(
        'ApiService.fetchCurrentWeather: Location: Lat: ${locationData.latitude} :: Lon: ${locationData.longitude}');

    final Map<String, dynamic>? queries = {
      'lat': locationData.latitude.toString(),
      'lon': locationData.longitude.toString(),
      'appid': APP_ID,
      'units': 'metric',
    };

    final response =
        await http.get(Uri.https(baseUrl, '/data/2.5/weather', queries));

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
