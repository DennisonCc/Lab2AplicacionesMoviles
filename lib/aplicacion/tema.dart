import 'package:flutter/material.dart';

ThemeData crearTema() {
  final esquema = ColorScheme.fromSeed(seedColor: Colors.indigo);
  return ThemeData(
    colorScheme: esquema,
    useMaterial3: true,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
  );
}
