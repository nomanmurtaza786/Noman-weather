import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing/constant/constant.dart';
import 'package:testing/controller/weather_controller.dart';
import 'package:testing/screen/weather_detail_screen.dart';
import 'package:testing/widget/temperatureminmax_widget.dart';
import 'package:testing/widget/weather_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class WeatherScreen extends GetView<WeatherController> {
  const WeatherScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: "Weather App".text.headline2(context).bold.make(),
        ),
        body: Column(
          children: [
            Row(
              children: [
                _searchfield()
                    .card
                    .roundedLg
                    .elevation(4)
                    .make()
                    .marginOnly(right: 15, top: 15)
                    .expand(),
                _locationButton(),
              ],
            ),
            _weatherDataView(context),
          ],
        ).marginSymmetric(horizontal: 15),
      ),
    );
  }

  Expanded _weatherDataView(BuildContext context) {
    return Expanded(
      child: controller.obx(
        (data) {
          //int mintemp = data?.main?.tempMin.toString() ?? "0.0";
          String maintemp = data?.main?.temp?.toInt().toString() ?? "0";

          String city = data?.name ?? "";
          String country = data?.sys?.country ?? "";

          String? _icon = data?.weather?.single.icon;
          return Column(
            children: [
              const Spacer(),
              if (!_icon.isEmptyOrNull) ...{
                Image.network(
                  "http://openweathermap.org/img/wn/$_icon@2x.png",
                )
              },
              Stack(
                clipBehavior: Clip.none,
                children: [
                  (maintemp).text.headline1(context).make(),
                  Positioned(
                      right: -25, top: 5, child: "o".text.size(30).bold.make()),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TemperatureMinMax(
                    name: "min",
                    temp: (data?.main?.tempMin ?? 0).toInt(),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  TemperatureMinMax(
                    name: "max",
                    temp: (data?.main?.tempMax ?? 0).toInt(),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                children: [
                  (city + ', ' + country).text.headline4(context).make(),
                ],
              ),
              const Spacer(),
              WeatherTile(
                title: "Wind Speed",
                subtitle: (data?.wind?.speed ?? 0).toString() + "km/h",
              ),
              const SizedBox(
                height: 15,
              ),
              WeatherTile(
                title: "Feels Like",
                subtitle: (data?.main?.feelsLike ?? 0).toString(),
              ),
              ElevatedButton(
                      key: const Key("ViewDetails"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            kSecondaryLightColor),
                      ),
                      onPressed: () {
                        Get.to(() => WeatherDetailScreen(
                              weatherData: data,
                            ));
                      },
                      child: "View Details".text.make())
                  .marginSymmetric(vertical: 15)
            ],
          );
        },
        onError: (e) {
          return Center(
            child: e.toString().text.headline4(context).make(),
          );
        },
      ),
    );
  }

  GestureDetector _locationButton() {
    return GestureDetector(
        onTap: () {
          controller.getLocationWeather();
        },
        child: Image.asset(
          "assets/location.png",
          height: 40,
          width: 40,
          color: kSecondaryLightColor,
        ).marginOnly(top: 16));
  }

  TextFormField _searchfield() {
    return TextFormField(
      controller: controller.searchText,
      onFieldSubmitted: (value) {
        controller.text.value = value.toString().trim();
        if (controller.text.value.isNotEmpty) {
          controller.getCityData();
        }
      },
      decoration: const InputDecoration(
        hintText: "Search here",
        contentPadding: EdgeInsets.only(left: 20, bottom: 0),
        border: InputBorder.none,
      ),
    );
  }
}
