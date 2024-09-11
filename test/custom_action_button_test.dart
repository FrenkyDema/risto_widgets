import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:risto_widgets/risto_widgets.dart';

void main() {
  group('ActionButtonWrapper Tests', () {});

  group('CustomActionButton Tests', () {
    testWidgets('CustomActionButton increments counter when pressed',
        (WidgetTester tester) async {
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

      expect(find.text('Press Me'), findsOneWidget);
      expect(counter, 0);

      await tester.tap(find.byType(CustomActionButton));
      await tester.pump(); // Rebuild the widget with the new state.

      expect(counter, 1);
    });

    testWidgets('CustomActionButton.flat renders correctly with 0 elevation',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomActionButton.flat(
              onPressed: () {},
              backgroundColor: Colors.red,
              child: const Text('Flat Button'),
            ),
          ),
        ),
      );

      expect(find.text('Flat Button'), findsOneWidget);
      final elevatedButton =
          tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(elevatedButton.style?.elevation?.resolve({}), equals(0.0));
    });

    testWidgets('CustomActionButton.raised renders with correct elevation',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomActionButton.raised(
              onPressed: () {},
              backgroundColor: Colors.green,
              elevation: 5.0,
              child: const Text('Raised Button'),
            ),
          ),
        ),
      );

      // Expect the button to be present
      expect(find.text('Raised Button'), findsOneWidget);

      // Find the ElevatedButton within the CustomActionButton
      final elevatedButtonFinder = find.descendant(
        of: find.byType(CustomActionButton),
        matching: find.byType(ElevatedButton),
      );

      // Ensure the ElevatedButton is found
      expect(elevatedButtonFinder, findsOneWidget);

      // Verify the elevation of the ElevatedButton
      final elevatedButton =
          tester.widget<ElevatedButton>(elevatedButtonFinder);
      expect(elevatedButton.style?.elevation?.resolve({}), equals(5.0));
    });

    testWidgets('CustomActionButton.raised renders with correct elevation',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomActionButton.raised(
              onPressed: () {},
              backgroundColor: Colors.green,
              elevation: 5.0,
              child: const Text('Raised Button'),
            ),
          ),
        ),
      );

      // Ensure the button is present
      expect(find.text('Raised Button'), findsOneWidget);

      // Find the ElevatedButton widget using find.byType
      final elevatedButton =
          tester.widget<ElevatedButton>(find.byType(ElevatedButton));

      // Verify the elevation is correct
      expect(elevatedButton.style?.elevation?.resolve({}), equals(5.0));
    });

    testWidgets('CustomActionButton shows disabled state correctly',
        (WidgetTester tester) async {
      // Build the widget with a disabled button
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomActionButton(
              onPressed: null, // Disabled state
              child: Text('Disabled Button'),
            ),
          ),
        ),
      );

      // Verify the disabled button is present with correct text
      expect(find.text('Disabled Button'), findsOneWidget);

      // Verify that a CustomActionDisable is rendered instead of ElevatedButton
      final customActionDisableFinder = find.byType(CustomActionDisable);
      expect(customActionDisableFinder, findsOneWidget);

      // Now find the specific `Container` inside `CustomActionDisable`
      final containerFinder = find.descendant(
        of: customActionDisableFinder,
        matching: find.byType(Container),
      );

      expect(
          containerFinder, findsOneWidget); // Ensure there's only one container

      // Verify the decoration of the Container (background color and border)
      final container = tester.widget<Container>(containerFinder);
      final decoration = container.decoration as BoxDecoration;

      // Check for the disabled color and transparent border
      expect(decoration.color,
          equals(Theme.of(tester.element(containerFinder)).disabledColor));
      expect(decoration.border?.top.color, equals(Colors.transparent));

      // Ensure no interaction (disabled state)
      await tester.tap(find.byType(CustomActionButton));
      await tester.pump(); // No state change should occur
    });
  });

  group('CustomIconText Tests', () {
    testWidgets('CustomIconText renders with correct icon and text',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomIconText(
              icon: Icons.star,
              text: 'Star',
              color: Colors.amber,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.text('Star'), findsOneWidget);
    });
  });
}
