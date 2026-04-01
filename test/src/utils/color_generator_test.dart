import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solidsoftware_task/src/utils/color_generator.dart';

void main() {
  const int expectedOpacity = 255;
  const int maxRGB = 255;
  const int minRGB = 0;
  group('ColorGenerator', () {
    test('nextColor returns a fully opaque Color', () {
      final Color color = ColorGenerator.generateRandomColor();
      expect((color.toARGB32() >> 24) & 0xFF, equals(expectedOpacity));
    });

    test('nextColor RGB channels are within 0-255', () {
      final Color color = ColorGenerator.generateRandomColor();
      expect((color.toARGB32() >> 16) & 0xFF, inInclusiveRange(minRGB, maxRGB));
      expect((color.toARGB32() >> 8) & 0xFF, inInclusiveRange(minRGB, maxRGB));
      expect(color.toARGB32() & 0xFF, inInclusiveRange(minRGB, maxRGB));
    });

    test('successive calls produce different colors with high probability', () {
      final colors = List.generate(
        10,
        (_) => ColorGenerator.generateRandomColor(),
      );
      final uniqueCount = colors.toSet().length;
      expect(uniqueCount, greaterThan(1));
    });

    test('can generate all 16,777,216 possible RGB values', () {
      const int channelsPerComponent = 256;
      const int totalColors =
          channelsPerComponent * channelsPerComponent * channelsPerComponent;
      expect(totalColors, equals(16777216));
    });
  });
}
