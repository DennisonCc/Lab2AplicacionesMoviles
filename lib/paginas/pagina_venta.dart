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
  final ScrollController _scrollController = ScrollController();
  ResultadoVenta? _resultado;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlantillaScaffold(
      titulo: 'Venta',
      scrollController: _scrollController,
      child: Column(
        children: [
          FormularioVenta(
            onCalcular: (subtotal) {
              setState(() => _resultado = calcularVenta(EntradaVenta(subtotal)));
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
          if (_resultado != null) FacturaVenta(resultado: _resultado!),
        ],
      ),
    );
  }
}
