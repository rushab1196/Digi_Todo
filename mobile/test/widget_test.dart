import 'package:flutter_test/flutter_test.dart';
import 'package:digi_task/main.dart';

void main() {
  testWidgets('App starts', (tester) async {
    await tester.pumpWidget(const DigiTaskApp());
    expect(find.text('Tasks'), findsOneWidget);
  });
}
