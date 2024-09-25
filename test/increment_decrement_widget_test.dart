import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:risto_widgets/risto_widgets.dart';

void main() {
  group('IncrementDecrementWidget', () {
    testWidgets('Initial state is displayed correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: _IncrementDecrementTestWidget(),
          ),
        ),
      );

      // Verify the initial quantity is 1.
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('Increments quantity when add button is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: _IncrementDecrementTestWidget(),
          ),
        ),
      );

      // Tap the increment button.
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump(); // Trigger a rebuild after the tap.

      // Verify the quantity increases to 2.
      expect(find.text('2'), findsOneWidget);
    });

    testWidgets('Decrements quantity when remove button is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: _IncrementDecrementTestWidget(),
          ),
        ),
      );

      // Tap the increment button once to set quantity to 2.
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Tap the decrement button.
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump(); // Trigger a rebuild after the tap.

      // Verify the quantity decreases back to 1.
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('Decrement button is disabled when quantity is at minValue',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: _IncrementDecrementTestWidget(),
          ),
        ),
      );

      // Verify the decrement button is disabled when quantity is at minValue (1).
      final decrementButton =
          find.widgetWithIcon(CustomActionButton, Icons.remove);
      final CustomActionButton buttonWidget = tester.widget(decrementButton);
      expect(buttonWidget.onPressed,
          isNull); // onPressed should be null when disabled
    });

    testWidgets('Increment button is disabled when quantity is at maxQuantity',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: _IncrementDecrementTestWidget(),
          ),
        ),
      );

      // Tap the increment button until quantity reaches maxQuantity (10).
      for (int i = 0; i < 9; i++) {
        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();
      }

      // Verify the increment button is disabled when quantity reaches maxQuantity.
      final incrementButton =
          find.widgetWithIcon(CustomActionButton, Icons.add);
      final CustomActionButton buttonWidget = tester.widget(incrementButton);
      expect(buttonWidget.onPressed,
          isNull); // onPressed should be null when disabled
    });
  });
}

// A Stateful widget to manage the state during tests
class _IncrementDecrementTestWidget extends StatefulWidget {
  @override
  __IncrementDecrementTestWidgetState createState() =>
      __IncrementDecrementTestWidgetState();
}

class __IncrementDecrementTestWidgetState
    extends State<_IncrementDecrementTestWidget> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return IncrementDecrementWidget(
      quantity: quantity,
      maxQuantity: 10,
      minValue: 1,
      onChanged: (newQuantity) {
        setState(() {
          quantity = newQuantity;
        });
      },
    );
  }
}
