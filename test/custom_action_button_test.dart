import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:risto_widgets/risto_widgets.dart';

void main() {
  testWidgets('CustomActionButton test', (WidgetTester tester) async {
    int counter = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomActionButton(
            onPressed: () {
              counter++;
            },
            backgroundColor: Colors.blue,
            child: const Text('Press Me'),
          ),
        ),
      ),
    );

    // Verify the button is present and initial counter is 0.
    expect(find.text('Press Me'), findsOneWidget);
    expect(counter, 0);

    // Tap the button and verify the counter increments.
    await tester.tap(find.byType(CustomActionButton));
    await tester.pump(); // Rebuild the widget with the new state.

    expect(counter, 1);
  });
}
