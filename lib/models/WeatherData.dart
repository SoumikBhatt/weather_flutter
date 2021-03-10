class WeatherData {
  //weather
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  //main
  final double? temperature;
  final double? minTemperature;
  final double? maxTemperature;

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
      windSpeed: wind['speed'],
      sunrise: sys['sunrise'],
      sunset: sys['sunset'],
      time: json['dt'],
      city: json['name'],
      code: json['cod'],
    );
  }


}
