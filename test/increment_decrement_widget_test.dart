import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:risto_widgets/risto_widgets.dart';

void main() {
  testWidgets('IncrementDecrementWidget test', (WidgetTester tester) async {
    // Use a StatefulWidget to manage state during the test.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: _IncrementDecrementTestWidget(),
        ),
      ),
    );

    // Verify the initial quantity is 1.
    expect(find.text('1'), findsOneWidget);

    // Tap the increment button and verify the quantity increases.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump(); // Rebuild the widget with the new state.
    expect(find.text('2'), findsOneWidget); // Verify updated quantity.

    // Tap the decrement button and verify the quantity decreases.
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump(); // Rebuild the widget with the new state.
    expect(find.text('1'), findsOneWidget); // Verify updated quantity.
  });
}

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
      onIncrement: () {
        setState(() {
          quantity++;
        });
      },
      onDecrement: () {
        setState(() {
          quantity--;
        });
      },
    );
  }
}
