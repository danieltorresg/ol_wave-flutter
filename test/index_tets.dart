import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:old_wave_flutter/src/view/index.dart';
import 'package:old_wave_flutter/src/view/search.dart';

void main() {
  testWidgets("Busqueda de un producto", (WidgetTester tester) async {
    final busqueda = find.byKey(ValueKey("busqueda"));

    await tester.pumpWidget(MaterialApp(home: InitialPage()));
    await tester.enterText(busqueda, "Televisor");
    //await tester.pump();

    expect(find.text("Televisor"), findsOneWidget);
  });

  testWidgets("Verificar que pase a la vista de search",
      (WidgetTester tester) async {
    final search = Search();
    await tester.pumpWidget(Container(child: search));
    expect(find.byWidget(search), findsOneWidget);
  });
}
