import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/model/weather_forecast.dart';
import 'package:weather/model/weather_forecastday.dart';

Widget home_nextDays(WeatherForecast forecastday) {
  return ListView.builder(
    itemBuilder: (context, index) {
      Forecastday day = forecastday.forecast.forecastday[index];
      String urlImage = day.hour[12].condition.icon.substring(2);
      urlImage = "http://$urlImage";
      return ListTile(
        title:
            Text("${DateFormat("EEEE, dd").format(DateTime.parse(day.date))}"),
        leading: Image.network(urlImage),
        subtitle: Text("${day.day.maxtempC}° - ${day.day.mintempC}°"),
      );
    },
    itemCount: forecastday.forecast.forecastday.length,
  );
}
