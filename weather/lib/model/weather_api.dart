import 'dart:convert';
import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather/model/weather_currentAPI.dart';
import 'package:weather/model/weather_forecast.dart';

class WeatherAPI {
  late final String _key;
  late final String _ENDPOINT;
  late final String _current;
  late final String _forecast;
  late Position _gps;

  WeatherAPI() {
    _ENDPOINT = "http://api.weatherapi.com/v1";
    _key = "?key=7e2a7f07a92c4a4f98001002211212";
    _current = "$_ENDPOINT/current.json$_key";
    _forecast = "$_ENDPOINT/forecast.json$_key";
  }

  Future<WeatherCurrent> getCurrent() async {
    Position gps = await _determinePosition();
    http.Response response = await http
        .get(Uri.parse("$_current&q=${gps.latitude},${gps.longitude}"));
    WeatherCurrent current = WeatherCurrent.fromJson(jsonDecode(response.body));
    log("getCurrent response -> ${current.location.country}");
    return current;
  }

  Future<WeatherForecast> getForecast() async {
    Position gps = await _determinePosition();
    http.Response response = await http
        .get(Uri.parse("$_forecast&q=${gps.latitude},${gps.longitude}&days=7"));
    WeatherForecast forecast =
        WeatherForecast.fromJson(jsonDecode(response.body));
    log("getCurrent response -> ${forecast.forecast.forecastday[0].hour[0].time}");
    return forecast;
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
