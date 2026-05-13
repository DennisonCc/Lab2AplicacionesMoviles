import 'package:flutter/material.dart';

import '../aplicacion/rutas.dart';
import '../diseno_atomico/organismos/formulario_ventas_monto.dart';
import '../diseno_atomico/organismos/resultado_ventas_monto.dart';
import '../diseno_atomico/plantillas/plantilla_scaffold.dart';
import '../dominio/calculo_ventas_monto.dart';

class PaginaVentasMonto extends StatefulWidget {
  const PaginaVentasMonto({super.key});

  @override
  State<PaginaVentasMonto> createState() => _PaginaVentasMontoState();
}

class _PaginaVentasMontoState extends State<PaginaVentasMonto> {
  final ScrollController _scrollController = ScrollController();
  ResultadoVentasMonto? _resultado;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return PlantillaScaffold(
      titulo: 'Ventas por Monto',
      scrollController: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormularioVentasMonto(
            onCalcular: (entrada) {
              final resultado = calcularVentasMonto(entrada);
              setState(() => _resultado = resultado);
              // esperar un frame y desplazar hacia el final
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (!_scrollController.hasClients) return;
                _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              });
            },
          ),
          const SizedBox(height: 12),
          if (_resultado != null) ResultadoVentasMontoWidget(resultado: _resultado!),
        ],
      ),
    );
  }
}