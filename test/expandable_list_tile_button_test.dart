import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:expandable/expandable.dart';
import 'package:risto_widgets/risto_widgets.dart';

void main() {
  testWidgets('ExpandableListTileButton test', (WidgetTester tester) async {
    ExpandableController controller = ExpandableController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ExpandableListTileButton(
            controller: controller,
            expanded: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey[200],
              child: const Text('Expanded content goes here'),
            ),
            buttonBody: const Text('Expandable ListTile Button'),
            buttonLeading: const Icon(Icons.info),
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );

    // Verify the ListTile is present.
    expect(find.text('Expandable ListTile Button'), findsOneWidget);

    // Initially, the expandable content should be hidden.
    expect(controller.expanded, false);

    // Tap the button to expand.
    await tester.tap(find.text('Expandable ListTile Button'));
    await tester.pumpAndSettle();  // Wait for animations to complete.

    // Verify that the controller's expanded state has changed.
    expect(controller.expanded, true);

    // Tap the button again to collapse.
    await tester.tap(find.text('Expandable ListTile Button'));
    await tester.pumpAndSettle();  // Wait for animations to complete.

    // Verify that the controller's expanded state has changed back.
    expect(controller.expanded, false);
  });
}