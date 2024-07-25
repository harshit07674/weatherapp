import 'package:flutter/material.dart';
import 'package:weather_animation/weather_animation.dart';


class WeatherBackground extends StatefulWidget {
  WeatherScene scene;
  WeatherBackground({Key? key,required this.scene}) : super(key: key);

  @override
  State<WeatherBackground> createState() => _WeatherBackgroundState();
}

class _WeatherBackgroundState extends State<WeatherBackground> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: widget.scene.sceneWidget,
    );
  }
}
