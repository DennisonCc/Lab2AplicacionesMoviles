import 'package:flutter/material.dart';

import '../../dominio/calculo_promedios.dart';
import '../atomos/tarjeta_app.dart';
import '../moleculas/encabezado_seccion.dart';

class ResultadosPromedios extends StatelessWidget {
  const ResultadosPromedios({super.key, required this.resultado});

  final ResultadoPromedios resultado;

  @override
  Widget build(BuildContext context) {
    return TarjetaApp(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EncabezadoSeccion(titulo: 'promedios'),
          for (final r in resultado.porSalon) ...[
            _fila(
              'salon ${r.indiceSalon} (${r.cantidadAlumnos} alumnos)',
              r.promedio.toStringAsFixed(2),
            ),
          ],
          const Divider(),
          _fila(
            'promedio general (${resultado.totalAlumnos} alumnos)',
            resultado.promedioGeneral.toStringAsFixed(2),
            esTotal: true,
          ),
        ],
      ),
    );
  }

  Widget _fila(String etiqueta, String valor, {bool esTotal = false}) {
    final estilo = esTotal
        ? const TextStyle(fontWeight: FontWeight.w700)
        : null;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(child: Text(etiqueta, style: estilo)),
          Text(valor, style: estilo),
        ],
      ),
    );
  }
}
