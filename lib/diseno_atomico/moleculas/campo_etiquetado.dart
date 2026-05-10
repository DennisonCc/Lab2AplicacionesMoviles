import 'package:flutter/material.dart';

import '../atomos/campo_texto_app.dart';

class CampoEtiquetado extends StatelessWidget {
  const CampoEtiquetado({
    super.key,
    required this.controlador,
    required this.etiqueta,
    this.hint,
    this.textoAyuda,
    this.keyboardType,
  });

  final TextEditingController controlador;
  final String etiqueta;
  final String? hint;
  final String? textoAyuda;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: CampoTextoApp(
        controlador: controlador,
        etiqueta: etiqueta,
        hint: hint,
        textoAyuda: textoAyuda,
        keyboardType: keyboardType,
      ),
    );
  }
}
