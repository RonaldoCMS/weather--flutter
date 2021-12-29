import 'package:weather/model/weather_astro.dart';
import 'package:weather/model/weather_day.dart';
import 'package:weather/model/weather_hour.dart';

class Forecastday {
  late String date;
  late int dateEpoch;
  late Day day;
  late Astro astro;
  late List<Hour> hour;

  Forecastday({required this.date, required this.dateEpoch,required  this.day,required  this.astro,required  this.hour});

  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dateEpoch = json['date_epoch'];
    day = (json['day'] != null ? new Day.fromJson(json['day']) : null)!;
    astro = (json['astro'] != null ? new Astro.fromJson(json['astro']) : null)!;
    if (json['hour'] != null) {
      hour = [];
      json['hour'].forEach((v) {
        hour.add(new Hour.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['date_epoch'] = this.dateEpoch;
    if (this.day != null) {
      data['day'] = this.day.toJson();
    }
    if (this.astro != null) {
      data['astro'] = this.astro.toJson();
    }
    if (this.hour != null) {
      data['hour'] = this.hour.map((v) => v.toJson()).toList();
    }
    return data;
  }
}