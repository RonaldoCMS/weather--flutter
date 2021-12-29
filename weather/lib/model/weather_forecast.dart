import 'package:weather/model/weather_current.dart';
import 'package:weather/model/weather_forecastday.dart';
import 'package:weather/model/weather_location.dart';

class WeatherForecast {
  late Location location;
  late Current current;
  late Forecast forecast;

  WeatherForecast(
      {required this.location, required this.current, required this.forecast});

  WeatherForecast.fromJson(Map<String, dynamic> json) {
    location = (json['location'] != null
        ? new Location.fromJson(json['location'])
        : null)!;
    current = (json['current'] != null
        ? new Current.fromJson(json['current'])
        : null)!;
    forecast = (json['forecast'] != null
        ? new Forecast.fromJson(json['forecast'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    if (this.current != null) {
      data['current'] = this.current.toJson();
    }
    if (this.forecast != null) {
      data['forecast'] = this.forecast.toJson();
    }
    return data;
  }
}

class Forecast {
  late List<Forecastday> forecastday;

  Forecast({required this.forecastday});

  Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      forecastday = [];
      json['forecastday'].forEach((v) {
        forecastday.add(new Forecastday.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.forecastday != null) {
      data['forecastday'] = this.forecastday.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
