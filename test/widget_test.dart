
import 'package:flutter_test/flutter_test.dart';
import 'package:ghostapp/main.dart';

void main() {
  testWidgets('GhostApp displays its welcome screen', (tester) async {
    await tester.pumpWidget(const GhostApp());

    expect(find.text('GhostApp'), findsOneWidget);
    expect(find.text('Your thoughts. Your space.'), findsOneWidget);
    expect(find.text('Get started'), findsOneWidget);
  });

  testWidgets('Get started opens the authentication screen', (tester) async {
    await tester.pumpWidget(const GhostApp());

    await tester.tap(find.text('Get started'));
    await tester.pumpAndSettle();

    expect(find.text('Sign in'), findsOneWidget);
    expect(find.text('New here? Create an account'), findsOneWidget);
  });
}
