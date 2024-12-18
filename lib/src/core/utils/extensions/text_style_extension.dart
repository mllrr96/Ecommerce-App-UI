
import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle{
  TextStyle copyWithColor (Color color) => copyWith(color: color);
}