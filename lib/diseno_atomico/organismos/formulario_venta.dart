import 'package:flutter/material.dart';

import '../atomos/boton_principal.dart';
import '../atomos/tarjeta_app.dart';
import '../moleculas/campo_etiquetado.dart';
import '../moleculas/encabezado_seccion.dart';

class FormularioVenta extends StatefulWidget {
  const FormularioVenta({super.key, required this.onCalcular});

  final ValueChanged<double> onCalcular;

  @override
  State<FormularioVenta> createState() => _FormularioVentaState();
}

class _FormularioVentaState extends State<FormularioVenta> {
  final _controlSubtotal = TextEditingController();
  String? _error;

  @override
  void dispose() {
    _controlSubtotal.dispose();
    super.dispose();
  }

  void _calcular() {
    setState(() => _error = null);
    final texto = _controlSubtotal.text.trim().replaceAll(',', '.');
    final valor = double.tryParse(texto);
    if (valor == null || valor < 0) {
      setState(() => _error = 'ingresa un subtotal valido');
      return;
    }
    widget.onCalcular(valor);
  }

  @override
  Widget build(BuildContext context) {
    return TarjetaApp(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EncabezadoSeccion(
            titulo: 'datos de venta',
            subtitulo: 'iva 15% y descuento 20% si subtotal > 2000',
          ),
          CampoEtiquetado(
            controlador: _controlSubtotal,
            etiqueta: 'subtotal (usd)',
            hint: 'ej: 1500.50',
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
          if (_error != null) ...[
            Text(
              _error!,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
            const SizedBox(height: 12),
          ],
          BotonPrincipal(texto: 'calcular', onPressed: _calcular),
        ],
      ),
    );
  }
}
