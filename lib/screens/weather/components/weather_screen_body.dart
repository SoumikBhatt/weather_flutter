import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:location/location.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weather_zone/backend/api_service.dart';
import 'package:weather_zone/models/weather_data.dart';
import 'package:weather_zone/screens/weather/components/forecast_horizontal.dart';
import 'package:weather_zone/screens/weather/components/misc_information.dart';
import 'package:weather_zone/screens/weather/components/value_tile.dart';
import 'package:weather_zone/screens/weather/components/weather_information.dart';
import 'package:weather_zone/utils/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Location _location = Location();
  LocationData? _locationData;

  @override
  void initState() {
    super.initState();
  }

  Future<LocationData?> _getLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        print('_BodyState._getLocation: Location Service not enabled');
        return null;
      }
    }

    _permissionGranted = await _location.hasPermission();

    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        print('_BodyState._getLocation: Permission denied');
        return null;
      }
    }

    _locationData = await _location.getLocation();

    print(
        '_BodyState._getLocation: Lat: ${_locationData?.latitude} :: Lon: ${_locationData?.longitude}');

    return _locationData;
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<LocationData?>(
        future: _getLocation(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            final location = snapshot.data!;

            print('_BodyState.build: Lat: ${location.latitude} :: Lon: ${location.longitude}');

            return FutureBuilder<WeatherData?>(
              future: context.watch<ApiService>().fetchCurrentWeather(
                  location.latitude.toString(),
                  location.longitude.toString()),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  print('_BodyState.build: Error!: ${snapshot.error}');
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  print('_BodyState.build: Error: ${snapshot.error}');
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  final weather = snapshot.data!;

                  return SafeArea(
                    child: SizedBox(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: SizeConfig.screenHeight * 0.1,
                            ),
                            Text(
                              weather.city!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 5,
                                  fontSize: 25),
                            ),
                            SizedBox(
                              height: SizeConfig.screenHeight * 0.015,
                            ),
                            Text(
                              DateFormat('EEEE, d MMMM yyyy')
                                  .format(DateTime.now()),
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height: SizeConfig.screenHeight * 0.025,
                            ),
                            WeatherInformation(
                              description: weather.description!,
                              temperature: weather.temperature.toString(),
                              iconData: weather.getIconData(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ValueTile("max", '${weather.maxTemperature}°'),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                                  child: Center(
                                      child: Container(
                                        width: 1,
                                        height: 30,
                                        color: Colors.grey,
                                      )),
                                ),
                                ValueTile("min", '${weather.minTemperature}°'),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.screenHeight * 0.05,
                            ),
                            // ForecastHorizontal(),
                            Padding(
                              child: SizedBox(
                                width: SizeConfig.screenWidth! * 0.5,
                                child: Divider(
                                  color: Colors.grey,
                                ),
                              ),
                              padding: EdgeInsets.all(10),
                            ),
                            MiscInformation(
                              windSpeed: '${weather.windSpeed} m/s',
                              humidity: weather.humidity,
                              sunrise: weather.sunrise!,
                              sunset: weather.sunset!,
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
            );
          }
        },
      );





  }
}
