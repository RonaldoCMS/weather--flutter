

class Astro {
 late String sunrise;
 late  String sunset;
 late  String moonrise;
  late String moonset;
 late  String moonPhase;
 late  String moonIllumination;

  Astro(
      {required this.sunrise,
     required  this.sunset,
    required   this.moonrise,
    required   this.moonset,
    required   this.moonPhase,
    required   this.moonIllumination});

  Astro.fromJson(Map<String, dynamic> json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moon_phase'];
    moonIllumination = json['moon_illumination'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    data['moonrise'] = this.moonrise;
    data['moonset'] = this.moonset;
    data['moon_phase'] = this.moonPhase;
    data['moon_illumination'] = this.moonIllumination;
    return data;
  }
}