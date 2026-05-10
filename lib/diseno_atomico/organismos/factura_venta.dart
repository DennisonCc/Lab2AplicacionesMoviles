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
          const EncabezadoSeccion(titulo: 'factura detallada'),
          _fila('subtotal', _moneda(resultado.subtotal)),
          _fila('descuento', _moneda(resultado.descuento)),
          const Divider(),
          _fila('base imponible', _moneda(resultado.baseImponible)),
          _fila('iva (15%)', _moneda(resultado.iva)),
          const Divider(),
          _fila('total a pagar', _moneda(resultado.total), esTotal: true),
          const SizedBox(height: 12),
          _fila('sueldo del vendedor (10%)', _moneda(resultado.sueldoVendedor)),
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
          Text('\$$valor', style: estilo),
        ],
      ),
    );
  }
}
