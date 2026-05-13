import 'package:flutter/material.dart';

import '../diseno_atomico/organismos/resultado_ventas_monto.dart';
import '../diseno_atomico/plantillas/plantilla_scaffold.dart';
import '../dominio/calculo_ventas_monto.dart';

class PaginaResultadoVentasMonto extends StatelessWidget {
  const PaginaResultadoVentasMonto({super.key});

  @override
  Widget build(BuildContext context) {
    final argumentos = ModalRoute.of(context)?.settings.arguments;

    if (argumentos is! ResultadoVentasMonto) {
      return const PlantillaScaffold(
        titulo: 'Resultado Ventas por Monto',
        child: Center(child: Text('no se recibieron datos validos')),
      );
    }

    return PlantillaScaffold(
      titulo: 'Resultado Ventas por Monto',
      child: ResultadoVentasMontoWidget(resultado: argumentos),
    );
  }
}