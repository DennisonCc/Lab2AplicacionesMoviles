import 'package:flutter/material.dart';

import '../diseno_atomico/organismos/formulario_promedios.dart';
import '../diseno_atomico/organismos/resultados_promedios.dart';
import '../diseno_atomico/plantillas/plantilla_scaffold.dart';
import '../dominio/calculo_promedios.dart';

class PaginaPromedios extends StatefulWidget {
  const PaginaPromedios({super.key});

  @override
  State<PaginaPromedios> createState() => _PaginaPromediosState();
}

class _PaginaPromediosState extends State<PaginaPromedios> {
  final ScrollController _scrollController = ScrollController();
  ResultadoPromedios? _resultado;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlantillaScaffold(
      titulo: 'Promedios',
      scrollController: _scrollController,
      child: Column(
        children: [
          FormularioPromedios(
            onCalcular: (entrada) {
              setState(() => _resultado = calcularPromedios(entrada.edadesPorSalon));
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
          if (_resultado != null) ResultadosPromedios(resultado: _resultado!),
        ],
      ),
    );
  }
}
