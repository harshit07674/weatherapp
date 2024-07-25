import 'package:flutter/material.dart';


class WeatherModel {
  final String temp;
  final String temp_min;
  final String temp_max;
  final String humidity;
  final String speed;
  final String main;
  final String all;

  WeatherModel.fromMap(Map<String, dynamic> json)
      : temp = json["main"]["temp"].toString(),
        temp_max = json["main"]["temp_max"].toString(),
        temp_min = json["main"]["temp_min"].toString(),
        humidity = json["main"]["humidity"].toString(),
        speed = json["wind"]["speed"].toString(),
        main = json["weather"][0]["main"].toString(),
        all = json["clouds"]["all"].toString();
}