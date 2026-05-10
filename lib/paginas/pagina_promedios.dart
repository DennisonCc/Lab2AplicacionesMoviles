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
  ResultadoPromedios? _resultado;

  @override
  Widget build(BuildContext context) {
    return PlantillaScaffold(
      titulo: 'promedios',
      child: Column(
        children: [
          FormularioPromedios(
            onCalcular: (entrada) {
              setState(
                () => _resultado = calcularPromedios(entrada.edadesPorSalon),
              );
            },
          ),
          const SizedBox(height: 16),
          if (_resultado != null) ResultadosPromedios(resultado: _resultado!),
        ],
      ),
    );
  }
}
