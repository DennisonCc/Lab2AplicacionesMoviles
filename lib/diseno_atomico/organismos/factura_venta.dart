import 'package:flutter/material.dart';

import '../../dominio/calculo_venta.dart';
import '../atomos/tarjeta_app.dart';
import '../moleculas/encabezado_seccion.dart';

class FacturaVenta extends StatelessWidget {
  const FacturaVenta({super.key, required this.resultado});

  final ResultadoVenta resultado;

  String _moneda(double v) => v.toStringAsFixed(2);

  @override
  Widget build(BuildContext context) {
    return TarjetaApp(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EncabezadoSeccion(titulo: 'Factura detallada'),
          _fila(context, 'Subtotal', _moneda(resultado.subtotal)),
          _fila(context, 'Descuento', _moneda(resultado.descuento)),
          const Divider(),
          _fila(context, 'Base Imponible', _moneda(resultado.baseImponible)),
          _fila(context, 'IVA (15%)', _moneda(resultado.iva)),
          const Divider(),
          _fila(context, 'Total a Pagar', _moneda(resultado.total), esTotal: true),
          const SizedBox(height: 12),
          _fila(context, 'Sueldo del vendedor (10%)', _moneda(resultado.sueldoVendedor)),
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
          Text('\$$valor', style: estilo),
        ],
      ),
    );
  }
}
