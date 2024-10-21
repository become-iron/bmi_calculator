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
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF0A0E21),
          surface: Color(0xFF0A0E21),
          // surfaceTint: Color(0x1D1F33FF),
          // onPrimary: Colors.white,
          // onSecondary: Colors.white,
          // onTertiary: Colors.white,
        ),
        primaryTextTheme: Typography().white,
        textTheme: Typography().white,
        useMaterial3: true,
      ),
      home: const Calculator(),
    );
  }
}
