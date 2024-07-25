import 'package:flutter/material.dart';


TextStyle textScheme(FontWeight weight){
  return TextStyle(
    color: Colors.white,
    fontWeight: weight,
    fontSize: 32,
    fontStyle: FontStyle.normal,
    wordSpacing: 0.5,
    overflow: TextOverflow.ellipsis,
  );
}