import 'package:get/get.dart';
import 'package:testing/controller/weather_controller.dart';
import 'package:testing/services/internet_connection_checker.dart.dart';

class DataBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => WeatherController(), fenix: true);
    Get.put(InternetConnectionChecker(), permanent: true);
  }
}
