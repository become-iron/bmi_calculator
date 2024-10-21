import 'package:bmi_calculator/enums/common.dart' show Gender;
import 'package:bmi_calculator/widgets/gender_button.dart' show GenderButton;
import 'package:bmi_calculator/widgets/height_input.dart' show HeightInput;
import 'package:bmi_calculator/widgets/number_input.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Gender gender = Gender.male;
  int height = 160;
  int weight = 55;
  int age = 20;

  void _setGender(Gender value) {
    setState(() {
      gender = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        title: Center(
          child: Text(
            'BMI Calculator',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 24),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: GenderButton(
                            gender: Gender.male,
                            active: gender == Gender.male,
                            onPressed: () => _setGender(Gender.male),
                          ),
                        ),
                        SizedBox(width: 24),
                        Expanded(
                          child: GenderButton(
                            gender: Gender.female,
                            active: gender == Gender.female,
                            onPressed: () => _setGender(Gender.female),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Expanded(
                    child: HeightInput(
                      height: height,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 24),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                            child: NumberInput(
                          label: 'Weight',
                          min: 1,
                          max: 500,
                          value: weight,
                          onChanged: (value) {
                            setState(() {
                              weight = value;
                            });
                          },
                        )),
                        // Expanded(child: Placeholder()),
                        SizedBox(width: 24),
                        Expanded(
                            child: NumberInput(
                          label: 'Age',
                          min: 1,
                          max: 120,
                          value: age,
                          onChanged: (value) {
                            setState(() {
                              age = value;
                            });
                          },
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          FilledButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.zero),
              ),
              backgroundColor: Color(0xFFEB1655),
            ),
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.only(top: 12, bottom: 12),
              child: Text(
                'Calculate',
                style: TextStyle(
                  fontSize: 20,
                  // fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}