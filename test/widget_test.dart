import 'package:bmi_calculator/constants/bmi.dart';
import 'package:bmi_calculator/widgets/height_input.dart';
import 'package:bmi_calculator/widgets/number_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('HeightInput test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: HeightInput(
        height: defaultHeight,
        onChanged: (_) {},
      ),
    ));

    expect(find.text('$defaultHeight'), findsOneWidget);
  });

  testWidgets('NumberInput test', (WidgetTester tester) async {
    const int initialValue = 10;
    int value = initialValue;

    await tester.pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: NumberInput(
        min: 10,
        max: 30,
        label: 'Test',
        value: value,
        onChanged: (value_) {
          value = value_;
        },
      ),
    ));

    expect(find.text('Test'), findsOneWidget);

    expect(find.text('$value'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    const newValue = initialValue + 1;
    expect(value, newValue);
    // expect(find.text('$newValue'), findsOneWidget);
  });
}
