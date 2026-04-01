import 'package:flutter/material.dart';
import 'package:solidsoftware_task/src/utils/color_generator.dart';
import 'package:solidsoftware_task/src/widgets/background_overlay_widget.dart';
import 'package:solidsoftware_task/src/widgets/main_text_widget.dart';
import 'package:solidsoftware_task/src/widgets/tap_counter_label_widget.dart';

/// The home page displayed by the Color App.
class HomePage extends StatefulWidget {
  /// Creates the home page.
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const Duration _animationDuration = Duration(milliseconds: 400);
  static const Curve _animationCurve = Curves.easeInOut;

  Color _backgroundColor = ColorGenerator.generateRandomColor();
  int _tapCount = 0;

  void _onTap() {
    setState(() {
      _backgroundColor = ColorGenerator.generateRandomColor();
      _tapCount++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
    body: GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        duration: _animationDuration,
        curve: _animationCurve,
        color: _backgroundColor,
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            const BackgroundOverlayWidget(),
            Center(
              child: MainTextWidget(backgroundColor: _backgroundColor),
            ),
            Positioned(
              bottom: 100,
              left: 0,
              right: 0,
              child: TapCounterLabelWidget(tapCount: _tapCount),
            ),
          ],
        ),
      ),
    ),
  );
  }
}
