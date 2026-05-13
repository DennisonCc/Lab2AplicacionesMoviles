import 'package:flutter/material.dart';

import '../../dominio/calculo_caja_registradora.dart';
import '../atomos/boton_principal.dart';
import '../atomos/tarjeta_app.dart';
import '../moleculas/campo_etiquetado.dart';
import '../moleculas/encabezado_seccion.dart';

class FormularioCajaRegistradora extends StatefulWidget {
  const FormularioCajaRegistradora({super.key, required this.onCalcular});

  final ValueChanged<EntradaCajaRegistradora> onCalcular;

  @override
  State<FormularioCajaRegistradora> createState() =>
      _FormularioCajaRegistradoraState();
}

class _FormularioCajaRegistradoraState extends State<FormularioCajaRegistradora> {
  static const _billetesPermitidos = <int>[1, 5, 10, 20, 50, 100];
  static const _monedasPermitidasCentavos = <int>[1, 5, 10, 25, 50];

  late final Map<int, TextEditingController> _controlesBilletes;
  late final Map<int, TextEditingController> _controlesMonedasCentavos;
  String? _error;

  @override
  void initState() {
    super.initState();
    _controlesBilletes = {
      for (final d in _billetesPermitidos) d: TextEditingController(text: '0'),
    };
    _controlesMonedasCentavos = {
      for (final d in _monedasPermitidasCentavos)
        d: TextEditingController(text: '0'),
    };
  }

  @override
  void dispose() {
    for (final c in _controlesBilletes.values) {
      c.dispose();
    }
    for (final c in _controlesMonedasCentavos.values) {
      c.dispose();
    }
    super.dispose();
  }

  Map<int, int>? _parseCantidades(Map<int, TextEditingController> controles) {
    final salida = <int, int>{};
    for (final item in controles.entries) {
      final cantidad = int.tryParse(item.value.text.trim());
      if (cantidad == null || cantidad < 0) {
        return null;
      }
      salida[item.key] = cantidad;
    }
    return salida;
  }

  Widget _camposEnDosColumnas({
    required List<int> denominaciones,
    required Map<int, TextEditingController> controles,
    required String Function(int d) etiqueta,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final filas = <Widget>[];
        for (var i = 0; i < denominaciones.length; i += 2) {
          final izquierda = denominaciones[i];
          final int? derecha = i + 1 < denominaciones.length
              ? denominaciones[i + 1]
              : null;

          filas.add(
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CampoEtiquetado(
                    controlador: controles[izquierda]!,
                    etiqueta: etiqueta(izquierda),
                    hint: 'ej: 0',
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: derecha == null
                      ? const SizedBox.shrink()
                      : CampoEtiquetado(
                          controlador: controles[derecha]!,
                          etiqueta: etiqueta(derecha),
                          hint: 'ej: 0',
                          keyboardType: TextInputType.number,
                        ),
                ),
              ],
            ),
          );
        }

        return Column(children: filas);
      },
    );
  }

  void _calcular() {
    setState(() => _error = null);

    final cantidadesBilletes = _parseCantidades(_controlesBilletes);
    final cantidadesMonedasCentavos = _parseCantidades(_controlesMonedasCentavos);

    if (cantidadesBilletes == null || cantidadesMonedasCentavos == null) {
      setState(() => _error = 'Ingresa solo cantidades enteras y validas');
      return;
    }

    final totalPiezas =
        cantidadesBilletes.values.fold<int>(0, (a, b) => a + b) +
        cantidadesMonedasCentavos.values.fold<int>(0, (a, b) => a + b);
    if (totalPiezas == 0) {
      setState(() => _error = 'Ingresa al menos una pieza en alguna denominacion');
      return;
    }

    widget.onCalcular(
      EntradaCajaRegistradora(
        cantidadesBilletes: cantidadesBilletes,
        cantidadesMonedasCentavos: cantidadesMonedasCentavos,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TarjetaApp(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EncabezadoSeccion(
            titulo: 'Datos de Caja Registradora',
            subtitulo: 'ingresa cuantas piezas tienes de cada denominacion',
          ),
          Text('Billetes', style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 8),
          _camposEnDosColumnas(
            denominaciones: _billetesPermitidos,
            controles: _controlesBilletes,
            etiqueta: (d) => 'Billetes de \$$d',
          ),
          const SizedBox(height: 8),
          Text('Monedas (centavos)', style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 8),
          _camposEnDosColumnas(
            denominaciones: _monedasPermitidasCentavos,
            controles: _controlesMonedasCentavos,
            etiqueta: (d) => 'Monedas de $d ctvs',
          ),
          if (_error != null) ...[
            Text(
              _error!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            const SizedBox(height: 12),
          ],
          BotonPrincipal(texto: 'Calcular', onPressed: _calcular),
        ],
      ),
    );
  }
}