import 'package:flutter/material.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({super.key, this.tamano = 96});

  final double tamano;

  @override
  Widget build(BuildContext context) {
    final esquema = Theme.of(context).colorScheme;
    return Container(
      width: tamano,
      height: tamano,
      decoration: BoxDecoration(
        color: esquema.primaryContainer,
        borderRadius: BorderRadius.circular(tamano / 4),
      ),
      alignment: Alignment.center,
      child: Icon(
        Icons.calculate,
        size: tamano * 0.55,
        color: esquema.onPrimaryContainer,
      ),
    );
  }
}
