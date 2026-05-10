import 'package:flutter/material.dart';

import '../aplicacion/rutas.dart';
import '../diseno_atomico/organismos/lista_menu.dart';

class PaginaInicio extends StatelessWidget {
  const PaginaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('laboratorio')),
      body: ListaMenu(
        items: [
          ItemMenu(
            'problema 1: venta',
            () => Navigator.pushNamed(context, Rutas.venta),
          ),
          ItemMenu(
            'problema 2 (4.9): inversion',
            () => Navigator.pushNamed(context, Rutas.inversion),
          ),
          ItemMenu(
            'problema 2 (4.10): promedios',
            () => Navigator.pushNamed(context, Rutas.promedios),
          ),
        ],
      ),
    );
  }
}
