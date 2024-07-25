import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/Models/weather.dart';
import 'package:weather/constants/secretkey.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<WeatherModel> fetchWeather(String cityName) async {
 var url = "https://api.openweathermap.org/data/2.5/weather?q=${cityName}&units=metric&appid=${apikey}";

  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
   final Map<String, dynamic> decodedJson = json.decode(response.body);
   return WeatherModel.fromMap(decodedJson);
  } else {
   throw Exception('Failed to load album');
  }

}