import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:weather/model/weather_hour.dart';

Widget forecastSlot(List<Hour> hour) {
  int _current = 0;
  List imgList = [
    'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
  ];
  return CarouselSlider(
    items: hour.map((hour) {
      return Builder(
        builder: (BuildContext context) {
          String urlImage = hour.condition.icon.substring(2);
          urlImage = "http://$urlImage";
          return Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "${hour.time.substring(10)}",
                    textScaleFactor: 3,
                  ),
                ),
                Expanded(
                  child: Image.network(
                    urlImage,
                  ),
                ),
                Expanded(
                  child: Text(
                    "${hour.tempC.toInt()}°",
                    textScaleFactor: 3,
                  ),
                ),
              ],
            ),
          );
        },
      );
    }).toList(),
    options: CarouselOptions(),
  );
}
