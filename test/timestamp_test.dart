import 'package:flutter_test/flutter_test.dart';

import 'package:testing/main.dart';
import 'package:testing/screen/weather_detail_screen.dart';

void main() {
  test(
    'TimeStamp covertersion test',
    () {
      var timeTest = timeConversion(1636481085);
      prints(timeTest);
      expect(timeTest, '06:04 PM');
    },
  );
}
