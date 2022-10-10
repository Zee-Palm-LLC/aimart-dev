import 'package:flutter/material.dart';

class ColorModel {
  final String title;
  final Color colour;
  ColorModel({
    required this.title,
    required this.colour,
  });


}


List<ColorModel> colours = [
  ColorModel(title: 'White', colour:Colors.white),
  ColorModel(title: 'Red', colour:Colors.red),
  ColorModel(title: 'Green', colour:Colors.green),
  ColorModel(title: 'Black', colour:Colors.black),
  ColorModel(title: 'Blue', colour:Colors.blue),
];
