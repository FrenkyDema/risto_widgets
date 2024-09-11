import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:risto_widgets/risto_widgets.dart';

main() {
  testWidgets('ActionButtonWrapper renders with correct dimensions and margin',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ActionButtonWrapper(
            margin: const EdgeInsets.all(10.0),
            height: 50.0,
            width: 100.0,
            child: const Text('Button'),
          ),
        ),
      ),
    );

    // Verify the ActionButtonWrapper renders with correct size and margin.
    final container = tester.widget<Container>(find.byType(Container));
    expect(container.constraints?.maxHeight, equals(50.0));
    expect(container.constraints?.maxWidth, equals(100.0));
    expect(container.margin, equals(const EdgeInsets.all(10.0)));
  });
}
