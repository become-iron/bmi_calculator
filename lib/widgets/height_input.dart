import 'package:bmi_calculator/constants/bmi.dart' show minHeight, maxHeight;
import 'package:bmi_calculator/constants/theme.dart'
    show cardBackgroundColor, labelStyle, valueLabelStyle;
import 'package:flutter/material.dart';

class HeightInput extends StatelessWidget {
  final int height;
  final void Function(int value) onChanged;

  const HeightInput({super.key, required this.height, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Height',
              style: labelStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('$height', style: valueLabelStyle),
                const Text(' cm', style: TextStyle(fontSize: 24, color: Colors.grey)),
              ],
            ),
            Slider(
              activeColor: Colors.pinkAccent,
              inactiveColor: const Color(0xFF90939B),
              min: minHeight.toDouble(),
              max: maxHeight.toDouble(),
              onChanged: (value) => onChanged(value.toInt()),
              value: height.toDouble(),
            ),
          ],
        ),
      ),
    );
  }
}
