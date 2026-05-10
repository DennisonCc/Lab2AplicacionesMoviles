import 'package:flutter/material.dart';

class CampoTextoApp extends StatelessWidget {
  const CampoTextoApp({
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
    return TextField(
      controller: controlador,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: etiqueta,
        hintText: hint,
        helperText: textoAyuda,
      ),
    );
  }
}
