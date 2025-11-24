import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:snackbar_flutter/snackbar_flutter.dart';

void main() {
  group('CustomSnackBar Tests', () {
    testWidgets('Shows classic style snackbar', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  onPressed: () {
                    CustomSnackBar.show(
                      context: context,
                      message: 'Test message',
                      type: SnackBarType.success,
                      style: SnackBarStyle.classic,
                    );
                  },
                  child: const Text('Show Snackbar'),
                );
              },
            ),
          ),
        ),
      );

      // Tap the button to show snackbar
      await tester.tap(find.text('Show Snackbar'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      // Verify snackbar message is displayed
      expect(find.text('Test message'), findsOneWidget);
    });

    testWidgets('Shows snackbar at top position', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  onPressed: () {
                    CustomSnackBar.show(
                      context: context,
                      message: 'Top message',
                      position: SnackBarPosition.top,
                    );
                  },
                  child: const Text('Show Top'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Top'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Top message'), findsOneWidget);
    });

    testWidgets('Shows snackbar with custom title', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  onPressed: () {
                    CustomSnackBar.show(
                      context: context,
                      message: 'Custom message',
                      title: 'Custom Title',
                    );
                  },
                  child: const Text('Show Custom'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Custom'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Custom Title'), findsOneWidget);
      expect(find.text('Custom message'), findsOneWidget);
    });

    testWidgets('Snackbar dismisses after duration', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  onPressed: () {
                    CustomSnackBar.show(
                      context: context,
                      message: 'Dismissible message',
                      duration: const Duration(seconds: 2),
                    );
                  },
                  child: const Text('Show'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Dismissible message'), findsOneWidget);

      // Wait for duration + animation time
      await tester.pump(const Duration(seconds: 2, milliseconds: 500));

      expect(find.text('Dismissible message'), findsNothing);
    });

    testWidgets('Shows error type snackbar', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  onPressed: () {
                    CustomSnackBar.show(
                      context: context,
                      message: 'Error occurred',
                      type: SnackBarType.error,
                    );
                  },
                  child: const Text('Show Error'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Error'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Error'), findsOneWidget);
      expect(find.text('Error occurred'), findsOneWidget);
    });

    testWidgets('Shows warning type snackbar', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  onPressed: () {
                    CustomSnackBar.show(
                      context: context,
                      message: 'Warning message',
                      type: SnackBarType.warning,
                    );
                  },
                  child: const Text('Show Warning'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Warning'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Warning'), findsOneWidget);
      expect(find.text('Warning message'), findsOneWidget);
    });

    testWidgets('Shows info type snackbar', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  onPressed: () {
                    CustomSnackBar.show(
                      context: context,
                      message: 'Info message',
                      type: SnackBarType.info,
                    );
                  },
                  child: const Text('Show Info'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Info'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Info'), findsOneWidget);
      expect(find.text('Info message'), findsOneWidget);
    });

    testWidgets('Shows minimal style snackbar', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  onPressed: () {
                    CustomSnackBar.show(
                      context: context,
                      message: 'Minimal style',
                      style: SnackBarStyle.minimal,
                    );
                  },
                  child: const Text('Show Minimal'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Minimal'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Minimal style'), findsOneWidget);
    });

    testWidgets('Shows gradient style snackbar', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  onPressed: () {
                    CustomSnackBar.show(
                      context: context,
                      message: 'Gradient style',
                      style: SnackBarStyle.gradient,
                    );
                  },
                  child: const Text('Show Gradient'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Gradient'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Gradient style'), findsOneWidget);
    });

    testWidgets('Shows compact style snackbar', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  onPressed: () {
                    CustomSnackBar.show(
                      context: context,
                      message: 'Compact',
                      style: SnackBarStyle.compact,
                    );
                  },
                  child: const Text('Show Compact'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Compact'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Compact'), findsOneWidget);
    });
  });

  group('SnackBarType Tests', () {
    test('All SnackBarType values exist', () {
      expect(SnackBarType.values.length, equals(10));
      expect(SnackBarType.values, contains(SnackBarType.success));
      expect(SnackBarType.values, contains(SnackBarType.error));
      expect(SnackBarType.values, contains(SnackBarType.warning));
      expect(SnackBarType.values, contains(SnackBarType.info));
      expect(SnackBarType.values, contains(SnackBarType.primary));
      expect(SnackBarType.values, contains(SnackBarType.secondary));
      expect(SnackBarType.values, contains(SnackBarType.dark));
      expect(SnackBarType.values, contains(SnackBarType.light));
      expect(SnackBarType.values, contains(SnackBarType.gradient));
      expect(SnackBarType.values, contains(SnackBarType.custom));
    });
  });

  group('SnackBarStyle Tests', () {
    test('All SnackBarStyle values exist', () {
      expect(SnackBarStyle.values.length, equals(24));
      expect(SnackBarStyle.values, contains(SnackBarStyle.classic));
      expect(SnackBarStyle.values, contains(SnackBarStyle.frosted));
      expect(SnackBarStyle.values, contains(SnackBarStyle.minimal));
      expect(SnackBarStyle.values, contains(SnackBarStyle.gradient));
      expect(SnackBarStyle.values, contains(SnackBarStyle.floating));
      expect(SnackBarStyle.values, contains(SnackBarStyle.material));
      expect(SnackBarStyle.values, contains(SnackBarStyle.ios));
      expect(SnackBarStyle.values, contains(SnackBarStyle.outlined));
      expect(SnackBarStyle.values, contains(SnackBarStyle.compact));
      expect(SnackBarStyle.values, contains(SnackBarStyle.expanded));
      expect(SnackBarStyle.values, contains(SnackBarStyle.iconOnly));
      expect(SnackBarStyle.values, contains(SnackBarStyle.neon));
      expect(SnackBarStyle.values, contains(SnackBarStyle.neumorphic));
      expect(SnackBarStyle.values, contains(SnackBarStyle.card));
      expect(SnackBarStyle.values, contains(SnackBarStyle.pill));
      expect(SnackBarStyle.values, contains(SnackBarStyle.banner));
      expect(SnackBarStyle.values, contains(SnackBarStyle.grunge));
      expect(SnackBarStyle.values, contains(SnackBarStyle.bubble));
      expect(SnackBarStyle.values, contains(SnackBarStyle.stripe));
      expect(SnackBarStyle.values, contains(SnackBarStyle.pixel));
      expect(SnackBarStyle.values, contains(SnackBarStyle.glass));
      expect(SnackBarStyle.values, contains(SnackBarStyle.threeDimensional));
      expect(SnackBarStyle.values, contains(SnackBarStyle.dotted));
      expect(SnackBarStyle.values, contains(SnackBarStyle.diagonal));
    });
  });

  group('SnackBarPosition Tests', () {
    test('All SnackBarPosition values exist', () {
      expect(SnackBarPosition.values.length, equals(2));
      expect(SnackBarPosition.values, contains(SnackBarPosition.top));
      expect(SnackBarPosition.values, contains(SnackBarPosition.bottom));
    });
  });
}
