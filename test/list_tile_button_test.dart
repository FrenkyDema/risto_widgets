import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:risto_widgets/risto_widgets.dart';

void main() {
  testWidgets('ListTileButton test', (WidgetTester tester) async {
    bool buttonPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListTileButton(
            body: const Text('ListTileButton'),
            leading: const Icon(Icons.list),
            onPressed: () {
              buttonPressed = true;
            },
          ),
        ),
      ),
    );

    // Verify the ListTileButton is present.
    expect(find.text('ListTileButton'), findsOneWidget);

    // Tap the ListTileButton and verify it triggers the onPressed callback.
    await tester.tap(find.byType(ListTileButton));
    await tester.pump(); // Rebuild the widget with the new state.

    expect(buttonPressed, true);
  });
}
