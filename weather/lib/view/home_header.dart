import 'package:flutter/material.dart';
import 'package:weather/model/weather_currentAPI.dart';

Widget home_header(WeatherCurrent weatherCurrent) {
  String urlImage = weatherCurrent.current.condition.icon.substring(2);
  urlImage = "http://$urlImage";
  return Container(
    
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "${weatherCurrent.location.name}",
              textScaleFactor: 3,
            ),
            Text(
              "${weatherCurrent.location.region}",
              textScaleFactor: 2,
            )
          ],
        ),
        Column(
          children: [
            Image.network(
              urlImage,
              width: 64,
              height: 64,
            ),
            Text(
              "${weatherCurrent.current.tempC}° C",
              textScaleFactor: 2,
            )
          ],
        )
      ],
    ),
  );
}
