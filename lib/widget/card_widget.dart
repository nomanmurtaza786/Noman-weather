import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({Key? key, this.title,this.subtitle}) : super(key: key);
  final String? title;
  final subtitle;


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title.toString().text.headline2(context).make(),
          const SizedBox(height: 15,),
          subtitle.toString().text.make(),
        ],
      ).box.p12.make(),
    );
  }

}
