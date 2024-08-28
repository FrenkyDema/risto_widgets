import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:risto_widgets/risto_widgets.dart';

void main() {
  testWidgets('OpenCustomSheet test', (WidgetTester tester) async {
    bool confirmed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                OpenCustomSheet.openConfirmSheet(
                  context,
                  body: const Text('Are you sure?'),
                  onClose: (value) {
                    confirmed = value == true;
                  },
                );
              },
              child: const Text('Open Sheet'),
            ),
          ),
        ),
      ),
    );

    // Verify the button to open the sheet is present.
    expect(find.text('Open Sheet'), findsOneWidget);

    // Tap the button to open the sheet.
    await tester.tap(find.text('Open Sheet'));
    await tester.pumpAndSettle(); // Wait for the sheet to appear.

    // Verify the sheet content is displayed.
    expect(find.text('Are you sure?'), findsOneWidget);

    // Tap the Confirm button and verify the onClose callback is triggered.
    await tester.tap(find.text('Confirm'));
    await tester.pumpAndSettle(); // Wait for the sheet to close.

    expect(confirmed, true);
  });
}
