import 'package:flutter/material.dart';
import 'package:weather/model/weather_current.dart';

Widget home_info(Current current) {
  return Column(
    children: [
      _container("umidità ", "${current.humidity}%"),
      Divider(),
      _container("vento", "${current.windKph}"),
      Divider(),
      _container("direzione", "${current.windDir}"),
      Divider(),
      _container("Precipitazioni", "${current.precipMm} mm"),
      Divider(),
      _container("UV", "${current.uv}"),
      Divider(),
    ],
  );
}

Widget _container(String key, String value) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black,
        )),
    child: Column(
      children: [
        Text(
          key,
          textScaleFactor: 1.5,
        ),
        Text(value),
      ],
    ),
  );
}
