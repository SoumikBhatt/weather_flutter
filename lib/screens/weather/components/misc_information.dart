import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_zone/screens/weather/components/value_tile.dart';

class MiscInformation extends StatelessWidget {
  final String windSpeed;
  final int sunrise, sunset, humidity;

  const MiscInformation(
      {Key key,
      @required this.windSpeed,
      @required this.sunrise,
      @required this.sunset,
      @required this.humidity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      ValueTile("wind speed", windSpeed),
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Center(
            child: Container(
          width: 1,
          height: 30,
          color: Colors.grey,
        )),
      ),
      ValueTile(
          "sunrise",
          DateFormat('h:m a')
              .format(DateTime.fromMillisecondsSinceEpoch(sunrise * 1000))),
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Center(
            child: Container(
          width: 1,
          height: 30,
          color: Colors.grey,
        )),
      ),
      ValueTile(
          "sunset",
          DateFormat('h:m a')
              .format(DateTime.fromMillisecondsSinceEpoch(sunset * 1000))),
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Center(
            child: Container(
          width: 1,
          height: 30,
          color: Colors.grey,
        )),
      ),
      ValueTile("humidity", '$humidity%'),
    ]);
  }
}
