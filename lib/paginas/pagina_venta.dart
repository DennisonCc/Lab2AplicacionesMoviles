import 'package:flutter/material.dart';

import '../diseno_atomico/organismos/factura_venta.dart';
import '../diseno_atomico/organismos/formulario_venta.dart';
import '../diseno_atomico/plantillas/plantilla_scaffold.dart';
import '../dominio/calculo_venta.dart';

class PaginaVenta extends StatefulWidget {
  const PaginaVenta({super.key});

  @override
  State<PaginaVenta> createState() => _PaginaVentaState();
}

class _PaginaVentaState extends State<PaginaVenta> {
  ResultadoVenta? _resultado;

  @override
  Widget build(BuildContext context) {
    return PlantillaScaffold(
      titulo: 'venta',
      child: Column(
        children: [
          FormularioVenta(
            onCalcular: (subtotal) {
              setState(
                () => _resultado = calcularVenta(EntradaVenta(subtotal)),
              );
            },
          ),
          const SizedBox(height: 16),
          if (_resultado != null) FacturaVenta(resultado: _resultado!),
        ],
      ),
    );
  }
}
