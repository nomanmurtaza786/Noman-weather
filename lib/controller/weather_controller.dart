import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:testing/constant/constant.dart';
import 'package:testing/model/weather_model.dart';
import 'package:testing/services/api_services.dart';

class WeatherController extends GetxController with StateMixin<WeatherModel> {
  String? weatherIcon;
  final ApiServices _apiServices = ApiServices();
  WeatherModel? storeData;
  TextEditingController searchText = TextEditingController();

  var text = "".obs;

  @override
  void onInit() {
    super.onInit();
    getLocationWeather();
  }

  Future getLocationWeather() async {
    change(null, status: RxStatus.loading());
    try {
      storeData = await _apiServices.getLocationWeather();
      return change(storeData, status: RxStatus.success());
    } catch (err) {
      change(null, status: RxStatus.error(err.toString()));
    }
  }

  Future getCityData() async {
    change(null, status: RxStatus.loading());
    try {
      storeData = await _apiServices.getCityWeather(text.value.toString());
      return change(storeData, status: RxStatus.success());
    } catch (err) {
      showErrorSnackBar(err.toString());
      change(null, status: RxStatus.error(err.toString()));
    }
  }
}
