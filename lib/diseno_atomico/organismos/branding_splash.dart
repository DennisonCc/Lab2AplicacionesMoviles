import 'package:flutter/material.dart';

import '../atomos/logo_app.dart';

class BrandingSplash extends StatelessWidget {
  const BrandingSplash({super.key});

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const LogoApp(tamano: 104),
        const SizedBox(height: 16),
        Text('labo2', style: tema.textTheme.headlineMedium),
        const SizedBox(height: 8),
        Text('laboratorio atomic design', style: tema.textTheme.bodyMedium),
      ],
    );
  }
}
