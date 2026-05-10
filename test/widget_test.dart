// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:labo2/aplicacion/aplicacion_labo2.dart';
import 'package:labo2/aplicacion/rutas.dart';

void main() {
  testWidgets('navegacion basica', (WidgetTester tester) async {
    await tester.pumpWidget(const AplicacionLabo2());

    // Splash
    expect(find.text('labo2'), findsOneWidget);
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    // Inicio
    expect(find.text('laboratorio'), findsOneWidget);
    await tester.tap(find.text('problema 1: venta'));
    await tester.pumpAndSettle();
    expect(find.text('venta'), findsOneWidget);

    // Pop
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.text('laboratorio'), findsOneWidget);

    // pushNamed a inversion
    Navigator.of(
      tester.element(find.text('laboratorio')),
    ).pushNamed(Rutas.inversion);
    await tester.pumpAndSettle();
    expect(find.text('inversion'), findsOneWidget);
  });
}
