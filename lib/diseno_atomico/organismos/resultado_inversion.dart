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
          const EncabezadoSeccion(titulo: 'Resultado'),
          _fila(context, 'Meses', '${resultado.meses}'),
          _fila(context, 'Aporte mensual', '\$${_moneda(resultado.aporteMensual)}'),
          _fila(context, 'Aportes totales', '\$${_moneda(resultado.aportesTotales)}'),
          const Divider(),
          _fila(
            context,
            'Monto final',
            '\$${_moneda(resultado.montoFinal)}',
            esTotal: true,
          ),
          _fila(context, 'Interés ganado', '\$${_moneda(resultado.interesGanado)}'),
        ],
      ),
    );
  }

  Widget _fila(BuildContext context, String etiqueta, String valor, {bool esTotal = false}) {
    final base = Theme.of(context).textTheme.bodyMedium;
    final estilo = esTotal
        ? Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700)
        : base;
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
