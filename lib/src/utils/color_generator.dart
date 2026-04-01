import 'dart:math';
import 'package:flutter/material.dart';

/// Utilities for generating random background colors.
abstract class ColorGenerator {
  static const int _channelMaxValue = 256;
  static const int _fullOpacity = 255;

  static final Random _random = Random();

  /// Generates a random [Color].
  static Color generateRandomColor() {
    final int red = _random.nextInt(_channelMaxValue);
    final int green = _random.nextInt(_channelMaxValue);
    final int blue = _random.nextInt(_channelMaxValue);
    
    return Color.fromARGB(_fullOpacity, red, green, blue);
  }
}
