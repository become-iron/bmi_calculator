import 'package:bmi_calculator/constants/theme.dart' show cardBackgroundColor;
import 'package:bmi_calculator/enums/common.dart' show BmiStatus, Gender;
import 'package:bmi_calculator/utils/bmi.dart';
import 'package:flutter/material.dart';

Map<BmiStatus, String> bmiStatusesToDescriptions = {
  BmiStatus.underweight:
      "Your BMI indicates that you're underweight. Consider speaking with a healthcare professional about ways to achieve a healthier weight.",
  BmiStatus.normal:
      'You have a normal weight. Great job maintaining a healthy balance!',
  BmiStatus.overweight:
      "Your BMI suggests you're slightly overweight. Making small lifestyle changes can help you move towards a healthier weight.",
  BmiStatus.obese:
      'Your BMI indicates obesity. It might be helpful to consult with a healthcare provider for personalized advice on achieving a healthier weight.',
};

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
    final (index, status) = calculateBmi(gender, height, weight, age);

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
                      status.name.toUpperCase(),
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      index.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 96,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      bmiStatusesToDescriptions[status]!,
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
