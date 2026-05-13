import 'package:flutter/material.dart';

import '../diseno_atomico/organismos/formulario_inversion.dart';
import '../diseno_atomico/organismos/resultado_inversion.dart';
import '../diseno_atomico/plantillas/plantilla_scaffold.dart';
import '../dominio/calculo_inversion.dart';

class PaginaInversion extends StatefulWidget {
  const PaginaInversion({super.key});

  @override
  State<PaginaInversion> createState() => _PaginaInversionState();
}

class _PaginaInversionState extends State<PaginaInversion> {
  final ScrollController _scrollController = ScrollController();
  ResultadoInversion? _resultado;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlantillaScaffold(
      titulo: 'Inversión',
      scrollController: _scrollController,
      child: Column(
        children: [
          FormularioInversion(
            onCalcular: (entrada) {
              setState(() {
                _resultado = calcularInversion(
                  aporteMensual: entrada.aporteMensual,
                  anios: entrada.anios,
                );
              });
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (!_scrollController.hasClients) return;
                _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeOut,
                );
              });
            },
          ),
          const SizedBox(height: 16),
          if (_resultado != null)
            ResultadoInversionWidget(resultado: _resultado!),
        ],
      ),
    );
  }
}
