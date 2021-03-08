import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_zone/screens/weather/components/value_tile.dart';

/// Renders a horizontal scrolling list of weather conditions
/// Used to show forecast
/// Shows DateTime, Weather Condition icon and Temperature
class ForecastHorizontal extends StatelessWidget {
  const ForecastHorizontal({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
        separatorBuilder: (context, index) => Divider(
          height: 100,
          color: Colors.white,
        ),
        // padding: EdgeInsets.only(left: 10, right: 10),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Center(
                child: ValueTile(
                  DateFormat('E, ha').format(
                      DateTime.fromMillisecondsSinceEpoch(4500 * 1000)),
                  '14°',
                  iconData: Icons.cloud_done_outlined,
                )),
          );
        },
      ),
    );
  }
}
