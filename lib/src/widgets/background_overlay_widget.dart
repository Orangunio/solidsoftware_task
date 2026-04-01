import 'package:flutter/material.dart';

/// A soft radial overlay placed above the background.
class BackgroundOverlayWidget extends StatelessWidget {
  /// Creates a background overlay.
  const BackgroundOverlayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 1.2,
            colors: [
              Color.fromRGBO(255, 255, 255, 0.15),
              Color.fromRGBO(0, 0, 0, 0.3),
            ],
          ),
        ),
      ),
    );
  }
}
