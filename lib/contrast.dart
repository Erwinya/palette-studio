import 'dart:math' as math;

import 'package:flutter/material.dart';

double relativeLuminance(Color color) {
  double channel(int c) {
    final v = c / 255.0;
    return v <= 0.03928 ? v / 12.92 : math.pow((v + 0.055) / 1.055, 2.4).toDouble();
  }

  final r = channel(color.red);
  final g = channel(color.green);
  final b = channel(color.blue);
  return 0.2126 * r + 0.7152 * g + 0.0722 * b;
}

double contrastRatio(Color a, Color b) {
  final l1 = relativeLuminance(a);
  final l2 = relativeLuminance(b);
  final lighter = math.max(l1, l2);
  final darker = math.min(l1, l2);
  return (lighter + 0.05) / (darker + 0.05);
}

String hexOf(Color color) {
  final hex = color.value.toRadixString(16).padLeft(8, '0').substring(2);
  return '#${hex.toUpperCase()}';
}
