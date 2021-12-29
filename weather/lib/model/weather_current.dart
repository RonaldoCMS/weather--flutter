import 'package:weather/model/weather_condition.dart';

class Current {
  late int lastUpdatedEpoch;
  late String lastUpdated;
  late double tempC;
  late double tempF;
  late int isDay;
  late Condition condition;
  late double windMph;
  late double windKph;
  late double windDegree;
  late String windDir;
  late double pressureMb;
  late double pressureIn;
  late double precipMm;
  late double precipIn;
  late double humidity;
  late double cloud;
  late double feelslikeC;
  late double feelslikeF;
  late double visKm;
  late double visMiles;
  late double uv;
  late double gustMph;
  late double gustKph;

  Current(
      {required this.lastUpdatedEpoch,
      required this.lastUpdated,
      required this.tempC,
      required this.tempF,
      required this.isDay,
      required this.condition,
      required this.windMph,
      required this.windKph,
      required this.windDegree,
      required this.windDir,
      required this.pressureMb,
      required this.pressureIn,
      required this.precipMm,
      required this.precipIn,
      required this.humidity,
      required this.cloud,
      required this.feelslikeC,
      required this.feelslikeF,
      required this.visKm,
      required this.visMiles,
      required this.uv,
      required this.gustMph,
      required this.gustKph});

  Current.fromJson(Map<String, dynamic> json) {
    lastUpdatedEpoch = json['last_updated_epoch'];
    lastUpdated = json['last_updated'];
    tempC = json['temp_c'] * 1.0;
    tempF = json['temp_f'] * 1.0;
    isDay = json['is_day'];
    condition = (json['condition'] != null
        ? new Condition.fromJson(json['condition'])
        : null)!;
    windMph = json['wind_mph'] * 1.0;
    windKph = json['wind_kph'] * 1.0;
    windDegree = json['wind_degree'] * 1.0;
    windDir = json['wind_dir'];
    pressureMb = json['pressure_mb'];
    pressureIn = json['pressure_in'];
    precipMm = json['precip_mm'];
    precipIn = json['precip_in'];
    humidity = json['humidity'] * 1.0;
    cloud = json['cloud'] * 1.0;
    feelslikeC = json['feelslike_c'];
    feelslikeF = json['feelslike_f'];
    visKm = json['vis_km'];
    visMiles = json['vis_miles'];
    uv = json['uv'];
    gustMph = json['gust_mph'];
    gustKph = json['gust_kph'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['last_updated_epoch'] = this.lastUpdatedEpoch;
    data['last_updated'] = this.lastUpdated;
    data['temp_c'] = this.tempC;
    data['temp_f'] = this.tempF;
    data['is_day'] = this.isDay;
    if (this.condition != null) {
      data['condition'] = this.condition.toJson();
    }
    data['wind_mph'] = this.windMph;
    data['wind_kph'] = this.windKph;
    data['wind_degree'] = this.windDegree;
    data['wind_dir'] = this.windDir;
    data['pressure_mb'] = this.pressureMb;
    data['pressure_in'] = this.pressureIn;
    data['precip_mm'] = this.precipMm;
    data['precip_in'] = this.precipIn;
    data['humidity'] = this.humidity;
    data['cloud'] = this.cloud;
    data['feelslike_c'] = this.feelslikeC;
    data['feelslike_f'] = this.feelslikeF;
    data['vis_km'] = this.visKm;
    data['vis_miles'] = this.visMiles;
    data['uv'] = this.uv;
    data['gust_mph'] = this.gustMph;
    data['gust_kph'] = this.gustKph;
    return data;
  }
}
