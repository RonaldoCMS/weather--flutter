import 'package:weather/model/weather_condition.dart';

class Day {
  late double maxtempC;
  late double maxtempF;
  late double mintempC;
  late double mintempF;
  late double avgtempC;
  late double avgtempF;
  late double maxwindMph;
  late double maxwindKph;
  late double totalprecipMm;
  late double totalprecipIn;
  late double avgvisKm;
  late double avgvisMiles;
  late double avghumidity;
  late double dailyWillItRain;
  late double dailyChanceOfRain;
  late double dailyWillItSnow;
  late double dailyChanceOfSnow;
  late Condition condition;
  late double uv;

  Day(
      {required this.maxtempC,
      required this.maxtempF,
      required this.mintempC,
      required this.mintempF,
      required this.avgtempC,
      required this.avgtempF,
      required this.maxwindMph,
      required this.maxwindKph,
      required this.totalprecipMm,
      required this.totalprecipIn,
      required this.avgvisKm,
      required this.avgvisMiles,
      required this.avghumidity,
      required this.dailyWillItRain,
      required this.dailyChanceOfRain,
      required this.dailyWillItSnow,
      required this.dailyChanceOfSnow,
      required this.condition,
      required this.uv});

  Day.fromJson(Map<String, dynamic> json) {
    maxtempC = json['maxtemp_c'];
    maxtempF = json['maxtemp_f'];
    mintempC = json['mintemp_c'];
    mintempF = json['mintemp_f'];
    avgtempC = json['avgtemp_c'];
    avgtempF = json['avgtemp_f'];
    maxwindMph = json['maxwind_mph'];
    maxwindKph = json['maxwind_kph'];
    totalprecipMm = json['totalprecip_mm'];
    totalprecipIn = json['totalprecip_in'];
    avgvisKm = json['avgvis_km'];
    avgvisMiles = json['avgvis_miles'] * 1.0;
    avghumidity = json['avghumidity'];
    dailyWillItRain = json['daily_will_it_rain'] * 1.0;
    dailyChanceOfRain = json['daily_chance_of_rain'] * 1.0;
    dailyWillItSnow = json['daily_will_it_snow'] * 1.0;
    dailyChanceOfSnow = json['daily_chance_of_snow'] * 1.0;
    condition = (json['condition'] != null
        ? new Condition.fromJson(json['condition'])
        : null)!;
    uv = json['uv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maxtemp_c'] = this.maxtempC;
    data['maxtemp_f'] = this.maxtempF;
    data['mintemp_c'] = this.mintempC;
    data['mintemp_f'] = this.mintempF;
    data['avgtemp_c'] = this.avgtempC;
    data['avgtemp_f'] = this.avgtempF;
    data['maxwind_mph'] = this.maxwindMph;
    data['maxwind_kph'] = this.maxwindKph;
    data['totalprecip_mm'] = this.totalprecipMm;
    data['totalprecip_in'] = this.totalprecipIn;
    data['avgvis_km'] = this.avgvisKm;
    data['avgvis_miles'] = this.avgvisMiles;
    data['avghumidity'] = this.avghumidity;
    data['daily_will_it_rain'] = this.dailyWillItRain;
    data['daily_chance_of_rain'] = this.dailyChanceOfRain;
    data['daily_will_it_snow'] = this.dailyWillItSnow;
    data['daily_chance_of_snow'] = this.dailyChanceOfSnow;
    if (this.condition != null) {
      data['condition'] = this.condition.toJson();
    }
    data['uv'] = this.uv;
    return data;
  }
}
