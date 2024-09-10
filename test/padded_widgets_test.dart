import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:risto_widgets/widgets/layouts/padded_widgets.dart';

void main() {
  group('PaddingWrapper', () {
    testWidgets('PaddingWrapper applies default padding',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: PaddingWrapper(
            child: Text('Test'),
          ),
        ),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));
      expect(padding.padding, const EdgeInsets.all(16.0)); // Default padding
    });

    testWidgets('PaddingWrapper applies all side padding',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: PaddingWrapper.all(
            padding: 20.0,
            child: const Text('Test'),
          ),
        ),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));
      expect(padding.padding, const EdgeInsets.all(20.0)); // Custom padding
    });

    testWidgets('PaddingWrapper applies symmetric padding',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: PaddingWrapper.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
            child: const Text('Test'),
          ),
        ),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));
      expect(padding.padding,
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0));
    });

    testWidgets('PaddingWrapper applies individual padding',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: PaddingWrapper.only(
            left: 10.0,
            top: 20.0,
            child: const Text('Test'),
          ),
        ),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));
      expect(
          padding.padding,
          const EdgeInsets.only(
              left: 10.0,
              top: 20.0,
              right: 16.0,
              bottom: 0.0)); // Check specific padding
    });
  });

  group('PaddedChildrenList', () {
    testWidgets('PaddedChildrenList applies default padding',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: PaddedChildrenList(
            children: [Text('Child 1'), Text('Child 2')],
          ),
        ),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));
      expect(
          padding.padding,
          const EdgeInsets.only(
              left: 16.0, right: 16.0, bottom: 16.0)); // Default padding
    });

    testWidgets('PaddedChildrenList applies all side padding',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: PaddedChildrenList.all(
            padding: 20.0,
            children: const [Text('Child 1'), Text('Child 2')],
          ),
        ),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));
      expect(padding.padding, const EdgeInsets.all(20.0));
    });

    testWidgets('PaddedChildrenList applies symmetric padding',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: PaddedChildrenList.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
            children: const [Text('Child 1'), Text('Child 2')],
          ),
        ),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));
      expect(padding.padding,
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0));
    });

    testWidgets('PaddingWrapper applies individual padding',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: PaddingWrapper.only(
            left: 10.0,
            top: 20.0,
            child: const Text('Test'),
          ),
        ),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));
      expect(
          padding.padding,
          const EdgeInsets.only(
              left: 10.0,
              top: 20.0,
              right: 16.0,
              bottom: 0.0)); // Check specific padding
    });
  });
}
