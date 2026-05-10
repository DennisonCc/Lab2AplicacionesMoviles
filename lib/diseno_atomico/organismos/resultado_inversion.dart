import 'package:flutter/material.dart';

import '../../dominio/calculo_inversion.dart';
import '../atomos/tarjeta_app.dart';
import '../moleculas/encabezado_seccion.dart';

class ResultadoInversionWidget extends StatelessWidget {
  const ResultadoInversionWidget({super.key, required this.resultado});

  final ResultadoInversion resultado;

  String _moneda(double v) => v.toStringAsFixed(2);

  @override
  Widget build(BuildContext context) {
    return TarjetaApp(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EncabezadoSeccion(titulo: 'resultado'),
          _fila('meses', '${resultado.meses}'),
          _fila('aporte mensual', '\$${_moneda(resultado.aporteMensual)}'),
          _fila('aportes totales', '\$${_moneda(resultado.aportesTotales)}'),
          const Divider(),
          _fila(
            'monto final',
            '\$${_moneda(resultado.montoFinal)}',
            esTotal: true,
          ),
          _fila('interes ganado', '\$${_moneda(resultado.interesGanado)}'),
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
