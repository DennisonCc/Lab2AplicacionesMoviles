import 'package:flutter/material.dart';

import '../../dominio/calculo_ventas_monto.dart';
import '../atomos/tarjeta_app.dart';
import '../moleculas/encabezado_seccion.dart';

class ResultadoVentasMontoWidget extends StatelessWidget {
  const ResultadoVentasMontoWidget({super.key, required this.resultado});

  final ResultadoVentasMonto resultado;

  String _moneda(double valor) => valor.toStringAsFixed(2);

  @override
  Widget build(BuildContext context) {
    return TarjetaApp(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EncabezadoSeccion(titulo: 'Resultado'),
          _fila(context, 'Ventas de 10000 o menos', '${resultado.ventasMenorOIgual10000}'),
          _fila(context, 'Monto de 10000 o menos', '\$${_moneda(resultado.montoMenorOIgual10000)}'),
          const Divider(),
          _fila(context, 'Ventas entre 10001 y 19999', '${resultado.ventasEntre10001Y19999}'),
          _fila(context, 'Monto entre 10001 y 19999', '\$${_moneda(resultado.montoEntre10001Y19999)}'),
          const Divider(),
          _fila(context, 'Ventas de 20000 o mas', '${resultado.ventasMayorOIgual20000}'),
          _fila(context, 'Monto de 20000 o mas', '\$${_moneda(resultado.montoMayorOIgual20000)}'),
          const Divider(),
          _fila(context, 'Total de ventas', '${resultado.totalVentas}', esTotal: true),
          _fila(context, 'Monto global', '\$${_moneda(resultado.montoGlobal)}', esTotal: true),
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