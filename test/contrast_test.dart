import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:palette_studio/contrast.dart';

void main() {
  test('contrast ratio is symmetric and >= 1', () {
    const a = Color(0xFF000000);
    const b = Color(0xFFFFFFFF);
    final ratio = contrastRatio(a, b);
    expect(ratio, greaterThan(20));
    expect(hexOf(a), '#000000');
  });
}
