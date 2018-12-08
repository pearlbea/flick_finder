import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flick_finder/ui/star_button.dart';

void main() {
  testWidgets('Star button test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Material(child: StarButton())));
    expect(find.byType(IconButton), findsOneWidget);
  });
}
