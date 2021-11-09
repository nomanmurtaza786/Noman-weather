import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class WeatherTile extends StatelessWidget {
  const WeatherTile({Key? key, this.title,this.subtitle}) : super(key: key);
  final String? title;
  final subtitle;


  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: title.toString().text.headline2(context).make(),
        trailing:  subtitle.toString().text.headline4(context).make(),
      ).box.alignCenter.height(50).make(),
    );
  }

}
