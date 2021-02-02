import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:old_wave_flutter/src/view/index.dart';

void main() {
  testWidgets("Busqueda de un producto", (WidgetTester tester) async {
    final busqueda = find.byKey(ValueKey("busqueda"));

    await tester.pumpWidget(MaterialApp(home: InitialPage()));
    await tester.enterText(busqueda, "Televisor");
    await tester.pump();

    expect(find.text("Televisor"), findsOneWidget);
  });
}
