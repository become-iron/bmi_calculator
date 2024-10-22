import 'package:bmi_calculator/constants/theme.dart';
import 'package:bmi_calculator/enums/common.dart';
import 'package:flutter/material.dart';

class GenderSettings {
  final String label;
  final IconData icon;

  const GenderSettings(this.label, this.icon);
}

Map<Gender, GenderSettings> genderSettings = {
  Gender.male: const GenderSettings('Male', Icons.male_rounded),
  Gender.female: const GenderSettings('Female', Icons.female_rounded),
};

class GenderButton extends StatelessWidget {
  final Gender gender;
  final bool active;
  final VoidCallback onPressed;

  const GenderButton({
    super.key,
    required this.gender,
    required this.active,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final GenderSettings selectedGenderSettings = genderSettings[gender]!;

    return FilledButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor:
            active ? cardBackgroundColor : cardBackgroundColorInactive,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              selectedGenderSettings.icon,
              color: theme.colorScheme.onPrimary,
              size: 96,
            ),
            Text(
              selectedGenderSettings.label,
              style: labelStyle,
            ),
          ],
        ),
      ),
    );
  }
}
