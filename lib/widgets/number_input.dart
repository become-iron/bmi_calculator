import 'package:bmi_calculator/constants/theme.dart'
    show cardBackgroundColor, labelStyle, valueLabelStyle;
import 'package:flutter/material.dart';

final iconStyle = IconButton.styleFrom(
  backgroundColor: Color(0xFF4E5062),
);

class NumberInput extends StatelessWidget {
  final String label;
  final int min;
  final int max;
  final int value;
  final void Function(int value) onChanged;

  const NumberInput({
    super.key,
    required this.min,
    required this.max,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  void updateValue(int delta) {
    final newValue = (value + delta).clamp(min, max);
    if (newValue != value) {
      onChanged(newValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardBackgroundColor,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(label, style: labelStyle),
            Text('$value', style: valueLabelStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  style: iconStyle,
                  onPressed: () {
                    updateValue(-1);
                  },
                  icon: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  style: iconStyle,
                  onPressed: () {
                    updateValue(1);
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
