import 'package:flutter/material.dart';
import 'package:weather_zone/screens/weather/components/weather_screen_body.dart';
import 'package:weather_zone/utils/size_config.dart';

class WeatherScreen extends StatelessWidget {
  static String routeName = '/weather_screen';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Body(),
    );
  }
}
