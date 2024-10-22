import 'package:bmi_calculator/constants/bmi.dart';
import 'package:bmi_calculator/enums/common.dart' show Gender;
import 'package:bmi_calculator/screens/results.dart';
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
  Gender gender = defaultGender;
  int height = defaultHeight;
  int weight = defaultWeight;
  int age = defaultAge;

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
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: theme.colorScheme.onPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 24),
              child: Column(
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
                        const SizedBox(width: 24),
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
                  const SizedBox(height: 24),
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
                  const SizedBox(height: 24),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                            child: NumberInput(
                          label: 'Weight',
                          min: minWeight,
                          max: maxWeight,
                          value: weight,
                          onChanged: (value) {
                            setState(() {
                              weight = value;
                            });
                          },
                        )),
                        const SizedBox(width: 24),
                        Expanded(
                            child: NumberInput(
                          label: 'Age',
                          min: minAge,
                          max: maxAge,
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
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.zero),
              ),
              backgroundColor: const Color(0xFFEB1655),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Results(
                    gender: gender,
                    height: height,
                    weight: weight,
                    age: age,
                  ),
                ),
              );
            },
            child: const Padding(
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
