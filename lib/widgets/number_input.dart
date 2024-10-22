import 'dart:async';

import 'package:bmi_calculator/constants/theme.dart'
    show cardBackgroundColor, labelStyle, valueLabelStyle;
import 'package:flutter/material.dart';

final iconStyle = IconButton.styleFrom(
  backgroundColor: Color(0xFF4E5062),
);

class NumberInput extends StatefulWidget {
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

  @override
  State<NumberInput> createState() => _NumberInputState();
}

class _NumberInputState extends State<NumberInput> {
  Timer? _timer;

  void updateValue(bool increment) {
    final delta = increment ? 1 : -1;
    final newValue = (widget.value + delta).clamp(widget.min, widget.max);
    if (newValue != widget.value) {
      widget.onChanged(newValue);
    }
  }

  void _handleLongPressStart(bool increment) {
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      updateValue(increment);
    });
  }

  void _handleLongPressStop() {
    if (_timer != null) {
      _timer!.cancel();
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
            Text(widget.label, style: labelStyle),
            Text('${widget.value}', style: valueLabelStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTapDown: (_) => _handleLongPressStart(false),
                  onTapUp: (_) => _handleLongPressStop(),
                  onTapCancel: _handleLongPressStop,
                  child: IconButton(
                    style: iconStyle,
                    onPressed: () {
                      updateValue(false);
                    },
                    icon: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
                GestureDetector(
                  onTapDown: (_) => _handleLongPressStart(true),
                  onTapUp: (_) => _handleLongPressStop(),
                  onTapCancel: _handleLongPressStop,
                  child: IconButton(
                    style: iconStyle,
                    onPressed: () {
                      updateValue(true);
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
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
