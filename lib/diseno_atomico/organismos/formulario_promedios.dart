import 'package:flutter/material.dart';

import '../atomos/boton_principal.dart';
import '../atomos/tarjeta_app.dart';
import '../moleculas/campo_etiquetado.dart';
import '../moleculas/encabezado_seccion.dart';

class EntradaPromedios {
  final List<List<int>> edadesPorSalon;
  const EntradaPromedios(this.edadesPorSalon);
}

class FormularioPromedios extends StatefulWidget {
  const FormularioPromedios({super.key, required this.onCalcular});

  final ValueChanged<EntradaPromedios> onCalcular;

  @override
  State<FormularioPromedios> createState() => _FormularioPromediosState();
}

class _FormularioPromediosState extends State<FormularioPromedios> {
  final _controlCantidad = TextEditingController(text: '3');
  final _controlesEdades = <TextEditingController>[];
  String? _error;
  int _cantidadSalones = 3;

  @override
  void initState() {
    super.initState();
    _sincronizarControles();
  }

  @override
  void dispose() {
    _controlCantidad.dispose();
    for (final c in _controlesEdades) {
      c.dispose();
    }
    super.dispose();
  }

  void _sincronizarControles() {
    while (_controlesEdades.length < _cantidadSalones) {
      _controlesEdades.add(TextEditingController());
    }
    while (_controlesEdades.length > _cantidadSalones) {
      _controlesEdades.removeLast().dispose();
    }
  }

  void _actualizarCantidad() {
    final n = int.tryParse(_controlCantidad.text.trim());
    if (n == null || n <= 0 || n > 20) {
      setState(() => _error = 'ingresa una cantidad de salones valida (1-20)');
      return;
    }
    setState(() {
      _error = null;
      _cantidadSalones = n;
      _sincronizarControles();
    });
  }

  List<int>? _parseEdades(String texto) {
    final partes = texto
        .split(RegExp(r'[ ,;\n\t]+'))
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();
    if (partes.isEmpty) return const [];
    final edades = <int>[];
    for (final p in partes) {
      final v = int.tryParse(p);
      if (v == null || v < 0 || v > 120) return null;
      edades.add(v);
    }
    return edades;
  }

  void _calcular() {
    setState(() => _error = null);

    final edadesPorSalon = <List<int>>[];
    for (var i = 0; i < _cantidadSalones; i++) {
      final edades = _parseEdades(_controlesEdades[i].text);
      if (edades == null) {
        setState(() => _error = 'edades invalidas en salon ${i + 1}');
        return;
      }
      edadesPorSalon.add(edades);
    }

    widget.onCalcular(EntradaPromedios(edadesPorSalon));
  }

  @override
  Widget build(BuildContext context) {
    return TarjetaApp(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EncabezadoSeccion(
            titulo: 'Datos de Salones',
            subtitulo:
                'N variable por salon: ingresa edades separadas por coma o espacio',
          ),
          Row(
            children: [
              Expanded(
                child: CampoEtiquetado(
                  controlador: _controlCantidad,
                  etiqueta: 'Cantidad de salones (M)',
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 12),
              FilledButton(
                onPressed: _actualizarCantidad,
                child: const Text('Aplicar'),
              ),
            ],
          ),
          for (var i = 0; i < _cantidadSalones; i++) ...[
            CampoEtiquetado(
              controlador: _controlesEdades[i],
              etiqueta: 'Edades salon ${i + 1}',
              hint: 'ej: 10, 11, 9, 12',
              keyboardType: TextInputType.text,
            ),
          ],
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
