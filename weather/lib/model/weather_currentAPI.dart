import 'package:weather/model/weather_condition.dart';
import 'package:weather/model/weather_current.dart';

import 'package:weather/model/weather_currentAPI.dart';
import 'package:weather/model/weather_location.dart';

class WeatherCurrent {
  late Location location;
  late Current current;

  WeatherCurrent({required this.location, required this.current});

  WeatherCurrent.fromJson(Map<String, dynamic> json) {
    location = (json['location'] != null
        ? new Location.fromJson(json['location'])
        : null)!;
    current = (json['current'] != null
        ? new Current.fromJson(json['current'])
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
    return data;
  }
}