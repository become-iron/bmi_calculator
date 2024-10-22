import 'dart:math';

import 'package:bmi_calculator/enums/common.dart';

// source: https://en.wikipedia.org/wiki/Body_mass_index
// In fact, percentile data is required to calculate BMI for children and teens.
// So the current calculation is not accurate for all ages. Also, gender should
// be used to calculate BMI for children as well.
(double index, BmiStatus status) calculateBmi(
  Gender gender,
  int height,
  int weight,
  int age,
) {
  final heightM = height / 100;
  final index = weight / pow(heightM, 2);
  final status = switch (index) {
    <= 18.4 => BmiStatus.underweight,
    <= 24.9 => BmiStatus.normal,
    <= 29.9 => BmiStatus.overweight,
    _ => BmiStatus.obese
  };
  return (index, status);
}
