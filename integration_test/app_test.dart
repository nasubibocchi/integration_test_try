import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:integration_test_try/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  //1 time tap test
  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify the counter starts at 0.
      expect(find.text('0'), findsOneWidget);

      // Finds the floating action button to tap on.
      final Finder fab = find.byTooltip('Increment');

      // Emulate a tap on the floating action button.
      await tester.tap(fab);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 1.
      expect(find.text('1'), findsOneWidget);
    });
  });

  // 2 times tap test
  group('2tap', () {
    testWidgets('tap 2times on the floating action button, verify counter',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify the counter starts at 0.
      expect(find.text('0'), findsOneWidget);

      // Finds the floating action button to tap on.
      final Finder fab = find.byTooltip('Increment');

      // Emulate a tap on the floating action button.
      await tester.tap(fab).then((_) async => await tester.tap(fab));

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 1.
      expect(find.text('1'), findsNothing);
      // Verify the counter increments by 1.
      expect(find.text('2'), findsOneWidget);
    });
  });

  // second page test
  group('to 2nd page', () {
    testWidgets('page navigation to second page', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      //navigation to 2nd page
      final Finder routeButton =
          find.byKey(const Key('page route button to 2nd'));

      // Emulate a tap on the elevated button.
      await tester.tap(routeButton);

      //Trigger a frame.
      await tester.pumpAndSettle();

      expect(find.text('This is second page'), findsOneWidget);
    });
  });
}
