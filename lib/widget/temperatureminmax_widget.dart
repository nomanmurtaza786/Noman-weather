import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TemperatureMinMax extends StatelessWidget {
  const TemperatureMinMax({Key? key, this.name,this.temp}) : super(key: key);
  final String? name;
  final int? temp;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        name.toString().text.headline3(context).make(),
        Stack(
          clipBehavior: Clip.none,
          children: [
            temp.toString().text.headline4(context).make().box.margin(const EdgeInsets.only(top: 15)).make(),
            Positioned(
                right: -12,
                top: 14,
                child: "o".text.size(14).make()),
          ],
        ),
      ],
    );
  }

}
