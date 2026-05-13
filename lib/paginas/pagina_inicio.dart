import 'package:flutter/material.dart';

import '../aplicacion/rutas.dart';
import '../diseno_atomico/organismos/lista_menu.dart';

class PaginaInicio extends StatelessWidget {
  const PaginaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    final colores = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laboratorio')
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              decoration: BoxDecoration(
                color: colores.primaryContainer.withValues(alpha: 0.65),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text(
                    'BIENVENIDO',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: colores.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Selecciona un ejercicio para comenzar',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colores.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListaMenu(
              items: [
                ItemMenu(
                  'Problema 1: Venta',
                  () => Navigator.pushNamed(context, Rutas.venta),
                ),
                ItemMenu(
                  'Problema 2 (4.9): Inversion',
                  () => Navigator.pushNamed(context, Rutas.inversion),
                ),
                ItemMenu(
                  'Problema 2 (4.10): Promedios',
                  () => Navigator.pushNamed(context, Rutas.promedios),
                ),
                ItemMenu(
                  'Problema 2 (4.12): Caja Registradora',
                  () => Navigator.pushNamed(context, Rutas.cajaRegistradora),
                ),
                ItemMenu(
                  'Problema 2 (4.13): Ventas por Monto',
                  () => Navigator.pushNamed(context, Rutas.ventasMonto),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
