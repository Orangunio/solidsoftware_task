import 'package:flutter/material.dart';

/// A label showing how many times the screen has been tapped.
class TapCounterLabel extends StatelessWidget {
  /// Creates a tap counter label.
  const TapCounterLabel({required this.tapCount, super.key});

  /// The number of taps to display.
  final int tapCount;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Taps: $tapCount',
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Color.fromRGBO(255, 255, 255, 0.8),
      ),
    );
  }
}
