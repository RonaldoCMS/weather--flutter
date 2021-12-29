import 'package:flutter/cupertino.dart';
import 'package:weather/model/weather_api.dart';
import 'package:weather/model/weather_currentAPI.dart';
import 'package:weather/model/weather_forecast.dart';
import 'package:weather/model/weather_hour.dart';
import 'package:weather/model/weather_location.dart';

class Home extends ChangeNotifier {
  late WeatherAPI api;
  bool _loading = false;
  WeatherCurrent? currentWeather;
  WeatherForecast? forecastWeather;

  Home() {}

  Future<WeatherForecast?> getWeatherForecast() async {
    forecastWeather = await api.getForecast();
    return forecastWeather;
  }

  List<Hour> get getHoursDay =>
      forecastWeather!.forecast.forecastday.first.hour;
  WeatherCurrent get location => currentWeather!;
  WeatherForecast get forecast => forecastWeather!;
  String get country => currentWeather!.location.country;
  bool get isLoading => _loading;

  Future<void> initialise() async {
    api = WeatherAPI();
    // currentWeather = await api.getCurrent();
    //forecastWeather = await api.getForecast();
    //_loading = true;
    notifyListeners();
  }

  Future<bool> futures() async {
    currentWeather = await api.getCurrent();
    forecastWeather = await api.getForecast();

    if (currentWeather == null) return false;
    return true;
  }
}
