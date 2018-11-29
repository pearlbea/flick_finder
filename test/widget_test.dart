import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flick_finder/ui/home.dart';

void main() {
  testWidgets('HomePage test', (WidgetTester tester) async {
    final HomePage homePage = HomePage();
    await tester.pumpWidget(MaterialApp(home: homePage));
    expect(find.text('flick finder'), findsOneWidget);
  });
}
