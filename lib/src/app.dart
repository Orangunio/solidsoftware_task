import 'package:flutter/material.dart';
import 'package:solidsoftware_task/src/pages/home_page.dart';

/// The root widget for the Color App.
class App extends StatelessWidget {
  /// Creates an [App] widget.
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Color App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
