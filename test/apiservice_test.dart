import 'package:flutter_test/flutter_test.dart';
import 'package:testing/model/weather_model.dart';
import 'package:testing/services/api_services.dart';

void main() {
  test(
    'Get Api data',
    () async {
      final _apiTest = ApiServices();
      WeatherModel _res = await _apiTest.getCityWeather('sydney');

      expect(_res.name, 'Sydney');
      expect(_res.cod, 200);
    },
  );
}
