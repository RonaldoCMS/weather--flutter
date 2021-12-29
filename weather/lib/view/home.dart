import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:weather/model/weather_forecastday.dart';
import 'package:weather/view/home_current_container.dart';
import 'package:weather/view/home_forecast_slot.dart';
import 'package:weather/view/home_header.dart';
import 'package:weather/view/home_info.dart';
import 'package:weather/view/home_nextDays.dart';
import 'package:weather/view_model/home.dart' as viewModel;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<viewModel.Home>.reactive(
        viewModelBuilder: () => viewModel.Home(),
        onModelReady: (viewModel) => viewModel.initialise(),
        builder: (context, viewModel, child) => FutureBuilder(
            future: viewModel.futures(),
            builder: (context, AsyncSnapshot<bool> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                  return Center(child: Text("active"));
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    return body(viewModel);
                  } else {
                    return Center(child: Text("No internet"));
                  }
                case ConnectionState.none:
                  return Center(child: Text("none"));

                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator.adaptive());
              }
            }));
  }

  Widget body(viewModel.Home viewModel) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (buildContext, int) => home_header(viewModel.location),
                  childCount: 1,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (buildContext, int) => forecastSlot(viewModel.getHoursDay),
                  childCount: 1,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (buildContext, int) =>
                      home_info(viewModel.currentWeather!.current),
                  childCount: 1,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (buildContext, int) {
                    Forecastday day =
                        viewModel.forecastWeather!.forecast.forecastday[int];
                    String urlImage = day.hour[12].condition.icon.substring(2);
                    urlImage = "http://$urlImage";
                    return ListTile(
                      title: Text(
                          "${DateFormat("EEEE, dd").format(DateTime.parse(day.date))}"),
                      leading: Image.network(urlImage),
                      subtitle:
                          Text("${day.day.maxtempC}° - ${day.day.mintempC}°"),
                    );
                  },
                  childCount: viewModel.forecast!.forecast.forecastday.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
