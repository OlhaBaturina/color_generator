import 'dart:math';
import 'package:flutter/material.dart';

class ColorGenerator {
  static Random random = Random();

  static Color getColor() => Color.fromRGBO(
    random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
}