import 'package:flutter/material.dart';
import 'package:labo2/aplicacion/tema/tema_general.dart';

import 'rutas.dart';
import 'tema/export.dart';
import '../paginas/pagina_resultado_ventas_monto.dart';
import '../paginas/pagina_ventas_monto.dart';
import '../paginas/pagina_caja_registradora.dart';
import '../paginas/pagina_inicio.dart';
import '../paginas/pagina_inversion.dart';
import '../paginas/pagina_promedios.dart';
import '../paginas/pagina_splash.dart';
import '../paginas/pagina_venta.dart';

class AplicacionLabo2 extends StatelessWidget {
  const AplicacionLabo2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Labo 2',
      theme: TemaGeneral.temaClaro,
      initialRoute: Rutas.splash,
      routes: {
        Rutas.splash: (_) => const PaginaSplash(),
        Rutas.inicio: (_) => const PaginaInicio(),
        Rutas.venta: (_) => const PaginaVenta(),
        Rutas.ventasMonto: (_) => const PaginaVentasMonto(),
        Rutas.ventasMontoResultado: (_) => const PaginaResultadoVentasMonto(),
        Rutas.cajaRegistradora: (_) => const PaginaCajaRegistradora(),
        Rutas.inversion: (_) => const PaginaInversion(),
        Rutas.promedios: (_) => const PaginaPromedios(),
      },
    );
  }
}
