import 'package:flutter/material.dart';

import 'rutas.dart';
import 'tema.dart';
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
      title: 'Labo 2',
      theme: crearTema(),
      initialRoute: Rutas.splash,
      routes: {
        Rutas.splash: (_) => const PaginaSplash(),
        Rutas.inicio: (_) => const PaginaInicio(),
        Rutas.venta: (_) => const PaginaVenta(),
        Rutas.inversion: (_) => const PaginaInversion(),
        Rutas.promedios: (_) => const PaginaPromedios(),
      },
    );
  }
}
