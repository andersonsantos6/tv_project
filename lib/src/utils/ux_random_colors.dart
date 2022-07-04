import 'dart:math';

import 'package:flutter/material.dart';

class RandomColors {
  Color getColors(Random _random) {
    return Color.fromARGB(_random.nextInt(256), _random.nextInt(256),
        _random.nextInt(256), _random.nextInt(256));
  }
}
