import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weather_zone/utils/size_config.dart';

class WeatherInformation extends StatelessWidget {
  final String description, temperature;
  final IconData? iconData;
  final String? icon;

  const WeatherInformation(
      {Key? key,
      required this.description,
      required this.temperature,
      this.iconData,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon == null
            ? Icon(
                iconData,
                // color: Theme.of(context).accentColor,
                size: 96,
              )
            : Image.network(
                "https://openweathermap.org/img/w/$icon.png",
                width: 96,
                height: 96,
              ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.05,
        ),
        Text(
          '$temperature°c',
          style: TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.w100,
            // color: Theme.of(context).accentColor,
          ),
        ),
        Text(
          description.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w100,
            letterSpacing: 5,
            fontSize: 15,
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
