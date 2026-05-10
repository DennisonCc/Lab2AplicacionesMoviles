import 'package:flutter/material.dart';

class PlantillaScaffold extends StatelessWidget {
  const PlantillaScaffold({
    super.key,
    required this.titulo,
    required this.child,
  });

  final String titulo;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: SafeArea(
        child: ListView(padding: const EdgeInsets.all(16), children: [child]),
      ),
    );
  }
}
