// import 'dart:developer';

import 'package:bmi_calculator/screens/calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BmiCalculator());
}

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true;
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0A0E21),
          surface: const Color(0xFF0A0E21),
        ),
        primaryTextTheme: Typography().white,
        textTheme: Typography().white,
        useMaterial3: true,
      ),
      home: const Calculator(),
    );
  }
}
