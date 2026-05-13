import 'package:flutter/material.dart';

import '../../dominio/calculo_caja_registradora.dart';
import '../atomos/tarjeta_app.dart';
import '../moleculas/encabezado_seccion.dart';

class ResultadoCajaRegistradoraWidget extends StatelessWidget {
  const ResultadoCajaRegistradoraWidget({super.key, required this.resultado});

  final ResultadoCajaRegistradora resultado;

  String _moneda(double valor) => valor.toStringAsFixed(2);

  @override
  Widget build(BuildContext context) {
    return TarjetaApp(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EncabezadoSeccion(titulo: 'Resultado'),
          _fila(context, 'Piezas de billetes', '${resultado.totalPiezasBilletes}'),
          _fila(context, 'Total billetes', '\$${_moneda(resultado.totalBilletes)}'),
          const Divider(),
          _fila(context, 'Piezas de monedas', '${resultado.totalPiezasMonedas}'),
          _fila(context, 'Total monedas', '\$${_moneda(resultado.totalMonedas)}'),
          const Divider(),
          _fila(
            context,
            'Total general',
            '\$${_moneda(resultado.totalGeneral)}',
            esTotal: true,
          ),
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