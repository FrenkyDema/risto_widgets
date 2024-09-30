import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:risto_widgets/widgets/buttons/list_tile_button.dart';

void main() {
  group('ListTileButton Tests', () {
    testWidgets('ListTileButton renders correctly and responds to tap',
        (WidgetTester tester) async {
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
      expect(find.byIcon(Icons.list), findsOneWidget);

      // Tap the ListTileButton and verify it triggers the onPressed callback.
      await tester.tap(find.byType(ListTileButton));
      await tester.pump(); // Rebuild the widget with the new state.

      expect(buttonPressed, true);
    });

    testWidgets('ListTileButton displays subtitle and trailing widgets',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ListTileButton(
              body: const Text('ListTileButton'),
              subtitle: const Text('Subtitle Text'),
              trailing: const Icon(Icons.arrow_forward),
              onPressed: () {},
            ),
          ),
        ),
      );

      // Verify the body, subtitle, and trailing widgets are present.
      expect(find.text('ListTileButton'), findsOneWidget);
      expect(find.text('Subtitle Text'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
    });
  });

  group('IconListTileButton Tests', () {
    testWidgets('IconListTileButton renders correctly with custom sizeFactor',
        (WidgetTester tester) async {
      const double sizeFactor = 1.5;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IconListTileButton(
              icon: Icons.star,
              title: const Text('Icon ListTileButton'),
              sizeFactor: sizeFactor,
              onPressed: () {},
            ),
          ),
        ),
      );

      // Verify the IconListTileButton is present.
      expect(find.text('Icon ListTileButton'), findsOneWidget);
      expect(find.byIcon(Icons.star), findsOneWidget);

      // Verify the icon size is adjusted according to sizeFactor.
      final iconFinder = find.byIcon(Icons.star);
      final Icon iconWidget = tester.widget(iconFinder);
      expect(iconWidget.size,
          24.0 * sizeFactor); // Default size 24.0 times sizeFactor
    });

    testWidgets('IconListTileButton responds to tap',
        (WidgetTester tester) async {
      bool buttonPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IconListTileButton(
              icon: Icons.star,
              title: const Text('Icon ListTileButton'),
              onPressed: () {
                buttonPressed = true;
              },
            ),
          ),
        ),
      );

      // Tap the IconListTileButton and verify it triggers the onPressed callback.
      await tester.tap(find.byType(IconListTileButton));
      await tester.pump(); // Rebuild the widget with the new state.

      expect(buttonPressed, true);
    });
  });

  group('DoubleListTileButtons Tests', () {
    testWidgets('DoubleListTileButtons renders two ListTileButtons',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DoubleListTileButtons(
              firstButton: ListTileButton(
                body: const Text('First Button'),
                onPressed: () {},
              ),
              secondButton: ListTileButton(
                body: const Text('Second Button'),
                onPressed: () {},
              ),
            ),
          ),
        ),
      );

      // Verify both buttons are present.
      expect(find.text('First Button'), findsOneWidget);
      expect(find.text('Second Button'), findsOneWidget);
    });
  });
}
