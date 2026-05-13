import 'package:flutter/material.dart';

import '../../dominio/calculo_ventas_monto.dart';
import '../atomos/boton_principal.dart';
import '../atomos/tarjeta_app.dart';
import '../moleculas/campo_etiquetado.dart';
import '../moleculas/encabezado_seccion.dart';

class FormularioVentasMonto extends StatefulWidget {
  const FormularioVentasMonto({super.key, required this.onCalcular});

  final ValueChanged<EntradaVentasMonto> onCalcular;

  @override
  State<FormularioVentasMonto> createState() => _FormularioVentasMontoState();
}

class _FormularioVentasMontoState extends State<FormularioVentasMonto> {
  final _controlCantidad = TextEditingController(text: '3');
  final _controlVentas = TextEditingController();
  final List<TextEditingController> _controlesVentas = [];
  String? _error;
  int _cantidad = 3;

  @override
  void dispose() {
    _controlCantidad.dispose();
    _controlVentas.dispose();
    for (final c in _controlesVentas) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _cantidad = int.tryParse(_controlCantidad.text.trim()) ?? 3;
    _syncControles();
    _controlCantidad.addListener(_onCantidadChanged);
  }

  void _onCantidadChanged() {
    final valor = int.tryParse(_controlCantidad.text.trim());
    if (valor == null) return;
    if (valor == _cantidad) return;
    setState(() {
      _cantidad = valor;
      _syncControles();
    });
  }

  void _syncControles() {
    if (_cantidad < 1) return;
    if (_cantidad > 200) return;
    while (_controlesVentas.length < _cantidad) {
      _controlesVentas.add(TextEditingController());
    }
    while (_controlesVentas.length > _cantidad) {
      final c = _controlesVentas.removeLast();
      c.dispose();
    }
  }

  List<double>? _parseVentas(String texto) {
    final partes = texto
        .split(RegExp(r'[ ,;\n\t]+'))
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();

    if (partes.isEmpty) {
      return const [];
    }

    final ventas = <double>[];
    for (final parte in partes) {
      final valor = double.tryParse(parte.replaceAll(',', '.'));
      if (valor == null || valor < 0) {
        return null;
      }
      ventas.add(valor);
    }

    return ventas;
  }

  void _calcular() {
    setState(() => _error = null);
    final cantidadVentas = int.tryParse(_controlCantidad.text.trim());
    if (cantidadVentas == null || cantidadVentas <= 0 || cantidadVentas > 200) {
      setState(() => _error = 'ingresa una cantidad de ventas valida (1-200)');
      return;
    }

    if (_controlesVentas.length != cantidadVentas) {
      setState(() => _error = 'la cantidad de montos debe coincidir con N');
      return;
    }

    final ventas = <double>[];
    for (var i = 0; i < _controlesVentas.length; i++) {
      final text = _controlesVentas[i].text.trim();
      if (text.isEmpty) {
        setState(() => _error = 'completa todos los montos de ventas');
        return;
      }
      final valor = double.tryParse(text.replaceAll(',', '.'));
      if (valor == null || valor < 0) {
        setState(() => _error = 'ingresa montos validos (numero)');
        return;
      }
      ventas.add(valor);
    }

    widget.onCalcular(
      EntradaVentasMonto(cantidadVentas: cantidadVentas, ventas: ventas),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TarjetaApp(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EncabezadoSeccion(
            titulo: 'Datos de Ventas',
            subtitulo: 'Ingresa N ventas y sus montos para calcular cuantas superan el promedio',
          ),
          Row(
            children: [
              Expanded(
                child: CampoEtiquetado(
                  controlador: _controlCantidad,
                  etiqueta: 'Cantidad de ventas (N)',
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: Text(
                  'Se crearán campos individuales para cada venta',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Campos dinamicos para cada venta
          Column(
            children: List.generate(_controlesVentas.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: CampoEtiquetado(
                  controlador: _controlesVentas[index],
                  etiqueta: 'Venta ${index + 1}',
                  hint: 'ej: 12000',
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              );
            }),
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