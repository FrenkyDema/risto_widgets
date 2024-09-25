import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:risto_widgets/risto_widgets.dart';

void main() {
  group('OpenCustomSheet Tests', () {
    testWidgets('OpenCustomSheet Confirm Sheet Test',
        (WidgetTester tester) async {
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
                  ).show(context); // Make sure to call the show() method
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
      await tester.pumpAndSettle(); // Wait for the modal to render.

      // Ensure the sheet content is displayed.
      expect(find.text('Are you sure?'), findsOneWidget);

      // Tap the Confirm button and verify the onClose callback is triggered.
      await tester.tap(find.text('Confirm'));
      await tester.pumpAndSettle(); // Wait for the sheet to close.

      expect(confirmed, true);
    });

    testWidgets('OpenCustomSheet Close Sheet Test',
        (WidgetTester tester) async {
      bool closed = false;

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
                      closed = value == false;
                    },
                  ).show(context); // Call show() method
                },
                child: const Text('Open Sheet'),
              ),
            ),
          ),
        ),
      );

      // Tap the button to open the sheet.
      await tester.tap(find.text('Open Sheet'));
      await tester.pumpAndSettle(); // Wait for the modal to render.

      // Ensure the sheet content is displayed.
      expect(find.text('Are you sure?'), findsOneWidget);

      // Tap the Close button and verify the onClose callback is triggered.
      await tester.tap(find.text('Close'));
      await tester.pumpAndSettle(); // Wait for the sheet to close.

      expect(closed, true);
    });

    testWidgets('OpenCustomSheet Scrollable Sheet Test',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  OpenCustomSheet.scrollableSheet(
                    context,
                    initialChildSize: 0.5, // Start smaller
                    minChildSize: 0.25,
                    maxChildSize: 1.0,
                    body: ({scrollController}) {
                      return ListView.builder(
                        controller: scrollController,
                        itemCount: 50,
                        itemBuilder: (context, index) => ListTile(
                          title: Text('Item $index'),
                        ),
                      );
                    },
                  ).show(context);
                },
                child: const Text('Open Scrollable Sheet'),
              ),
            ),
          ),
        ),
      );

      // Tap the button to open the sheet
      await tester.tap(find.text('Open Scrollable Sheet'));
      await tester.pumpAndSettle();

      // Now scroll the list
      await tester.dragUntilVisible(
        find.text('Item 19'),
        find.byType(ListView),
        const Offset(0, -100),
      );
      await tester.pumpAndSettle();

      // Check if Item 19 is visible
      expect(find.text('Item 19'), findsOneWidget);
    });

    testWidgets('OpenCustomSheet barrier dismiss test',
        (WidgetTester tester) async {
      bool dismissed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  OpenCustomSheet(
                    barrierDismissible: true,
                    body: ({scrollController}) =>
                        const Text('Dismissable Sheet'),
                    onClose: (value) {
                      dismissed = value == null;
                    },
                  ).show(context);
                },
                child: const Text('Open Dismissable Sheet'),
              ),
            ),
          ),
        ),
      );

      // Verify the button to open the sheet is present.
      expect(find.text('Open Dismissable Sheet'), findsOneWidget);

      // Tap the button to open the sheet.
      await tester.tap(find.text('Open Dismissable Sheet'));
      await tester.pumpAndSettle(); // Wait for the sheet to appear.

      // Tap outside the sheet to dismiss it.
      await tester.tapAt(const Offset(10, 10));
      await tester.pumpAndSettle(); // Wait for the sheet to dismiss.

      // Verify that the dismiss action was triggered.
      expect(dismissed, true);
    });
  });
}
