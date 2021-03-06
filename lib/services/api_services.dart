import 'dart:async';
import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:testing/constant/constant.dart';
import 'package:testing/model/weather_model.dart';
import 'package:testing/services/location_services.dart';

import '../constant/constant.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ApiServices {
  static const Duration timeout = Duration(seconds: 20);
  static const String _baseUrl =
      'https://api.openweathermap.org/data/2.5/weather?';
  static String apiKey =
      '25651f476b195031e666fc17a707deb9'; //Please add key here

  Future getCityWeather(String city) async {
    try {
      bool _connection = await InternetConnectionChecker().hasConnection;

      if (!_connection) {
        showErrorSnackBar('No Internet Connection');
        return;
      }
      http.Response response = await http
          .get(Uri.parse('${_baseUrl}q=$city&appid=$apiKey&units=metric'))
          .timeout(timeout);
      return _processResponse(response);
    } on SocketException catch (_) {
      throw const SocketException('No Internet Connection');
    } on TimeoutException catch (_) {
      throw TimeoutException('Request Timed Out');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future getLocationWeather() async {
    try {
      bool _connection = await InternetConnectionChecker().hasConnection;

      if (!_connection) {
        showErrorSnackBar('No Internet Connection');
        return;
      }
      Position? position = await getUserLocation();
      if (position == null) {
        return;
      }

      http.Response response = await http
          .get(Uri.parse(
              '$_baseUrl&lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey&units=metric'))
          .timeout(timeout);
      return _processResponse(response);
    } on TimeoutException catch (_) {
      throw TimeoutException('Request Timed Out');
    } on SocketException catch (_) {
      throw const SocketException('No Internet Connection');
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

_processResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      WeatherModel responseJson = weatherFromJson(response.body);
      return responseJson;

    case 404:
      showErrorSnackBar('City not found');
      break;
    case 401:
      showErrorSnackBar('Invalid API key');
      break;

    case 500:
      throw Exception('Internal Server Error');
    default:
      throw Exception(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
