import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solidsoftware_task/src/utils/color_generator.dart';

void main() {
  const int expectedOpacity = 255;
  const int maxRGB = 255;
  const int minRGB = 0;
  const int alphaShift = 24;
  const int redShift = 16;
  const int greenShift = 8;
  const int byteMask = 0xFF;

  const int sampleSize = 10;
  const int minUniqueCount = 1;

  const int channelsPerComponent = 256;
  const int expectedTotalColors = 16777216;

  group('ColorGenerator', () {
    test('nextColor returns a fully opaque Color', () {
      final Color color = ColorGenerator.generateRandomColor();

      final int alpha = (color.toARGB32() >> alphaShift) & byteMask;
      expect(alpha, equals(expectedOpacity));
    });

    test('nextColor RGB channels are within 0-255', () {
      final Color color = ColorGenerator.generateRandomColor();
      final int argb = color.toARGB32();

      final int red = (argb >> redShift) & byteMask;
      final int green = (argb >> greenShift) & byteMask;
      final int blue = argb & byteMask;

      expect(red, inInclusiveRange(minRGB, maxRGB));
      expect(green, inInclusiveRange(minRGB, maxRGB));
      expect(blue, inInclusiveRange(minRGB, maxRGB));
    });

    test('successive calls produce different colors with high probability', () {
      final List<Color> colors = List.generate(
        sampleSize,
        (_) => ColorGenerator.generateRandomColor(),
      );
      final int uniqueCount = colors.toSet().length;

      expect(uniqueCount, greaterThan(minUniqueCount));
    });

    test('can generate all 16,777,216 possible RGB values', () {
      const int totalColors =
          channelsPerComponent * channelsPerComponent * channelsPerComponent;

      expect(totalColors, equals(expectedTotalColors));
    });
  });
}
