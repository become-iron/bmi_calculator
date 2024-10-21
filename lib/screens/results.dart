import 'package:bmi_calculator/constants/theme.dart' show cardBackgroundColor;
import 'package:bmi_calculator/enums/common.dart' show Gender;
import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final Gender gender;
  final int height;
  final int weight;
  final int age;

  const Results({
    super.key,
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: theme.colorScheme.onPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(12, 12, 12, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Your Result',
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 12),
            Expanded(
                child: Card(
              color: cardBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'NORMAL',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '22.3',
                      style: TextStyle(
                        fontSize: 96,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'You have a normal weight!',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
