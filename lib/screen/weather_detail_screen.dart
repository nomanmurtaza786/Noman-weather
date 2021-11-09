import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing/controller/weather_controller.dart';
import 'package:testing/model/weather_model.dart';
import 'package:testing/widget/card_widget.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';

class WeatherDetailScreen extends GetView<WeatherController> {
  const WeatherDetailScreen({Key? key, this.weatherData}) : super(key: key);
  final WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Weather Detail".text.headline2(context).make(),
        centerTitle: true,
      ),
      body: Column(
        children: [_dataGridView()],
      ),
    );
  }

  GridView _dataGridView() {
    return GridView(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        mainAxisExtent: 140.0,
      ),
      children: [
        WeatherCard(
          title: "Sunrise",
          subtitle: timeConversion(weatherData?.sys?.sunrise?.toInt() ?? 0),
        ),
        WeatherCard(
          title: "Sunset",
          subtitle: timeConversion(weatherData?.sys?.sunset?.toInt() ?? 0),
        ),
        WeatherCard(
          title: "See Level",
          subtitle: (weatherData?.main?.seaLevel ?? 0),
        ),
        WeatherCard(
          title: "Grand Level",
          subtitle: (weatherData?.main?.grndLevel ?? 0),
        ),
        WeatherCard(
            title: "Humidity",
            subtitle: (weatherData?.main?.humidity ?? 0).toString() + "%"),
        WeatherCard(
          title: "Gust",
          subtitle: (weatherData?.wind?.gust ?? 0).toInt(),
        ),
        WeatherCard(
            title: "Pressure",
            subtitle: (weatherData?.main?.pressure ?? 0).toString() + 'hPa')
      ],
    );
  }
}

timeConversion(int value) {
  //timestamp covert to date time
  var date = DateTime.fromMillisecondsSinceEpoch(value * 1000, isUtc: true);

  var time = DateFormat('hh:mm a').format(date);
  return time;
}
