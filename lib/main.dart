import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:my_portfolio/Core/theme/app_theme.dart';
import 'package:my_portfolio/features/home/presentation/screens/home_screen.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ahmed Ehab — Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
          PointerDeviceKind.trackpad,
        },
      ),
      home: const HomeScreen(),
    );
  }
}
