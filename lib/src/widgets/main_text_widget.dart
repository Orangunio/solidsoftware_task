import 'package:flutter/material.dart';

/// Displays the main greeting text with adaptive contrast.
class MainText extends StatelessWidget {
  /// Creates the main text widget.
  const MainText({required this.backgroundColor, super.key});

  /// The background color used to compute a contrasting text color.
  final Color backgroundColor;

  Color _contrastingTextColor(Color backgroundColor) {
    final bool isLight = ThemeData.estimateBrightnessForColor(
      backgroundColor,
    ) == Brightness.light;

    return isLight ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      style: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
        color: _contrastingTextColor(backgroundColor),
      ),
      child: const Text('Hello there'),
    );
  }
}
