import 'package:flutter/material.dart';

class WeatherInformation extends StatelessWidget {
  final String description, temperature;
  final IconData iconData;

  const WeatherInformation(
      {Key key,
      @required this.description,
      @required this.temperature,
      @required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        Icon(
          iconData,
          // color: Theme.of(context).accentColor,
          size: 65,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '$temperature°c',
          style: TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.w100,
            // color: Theme.of(context).accentColor,
          ),
        ),
      ],
    );
  }
}
