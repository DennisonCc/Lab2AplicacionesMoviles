import 'package:flutter/material.dart';

import '../atomos/boton_principal.dart';
import '../atomos/tarjeta_app.dart';
import '../moleculas/campo_etiquetado.dart';
import '../moleculas/encabezado_seccion.dart';

class EntradaInversion {
  final double aporteMensual;
  final int anios;
  const EntradaInversion({required this.aporteMensual, required this.anios});
}

class FormularioInversion extends StatefulWidget {
  const FormularioInversion({super.key, required this.onCalcular});

  final ValueChanged<EntradaInversion> onCalcular;

  @override
  State<FormularioInversion> createState() => _FormularioInversionState();
}

class _FormularioInversionState extends State<FormularioInversion> {
  final _controlAporte = TextEditingController();
  final _controlAnios = TextEditingController();
  String? _error;

  @override
  void dispose() {
    _controlAporte.dispose();
    _controlAnios.dispose();
    super.dispose();
  }

  void _calcular() {
    setState(() => _error = null);

    final aporte = double.tryParse(
      _controlAporte.text.trim().replaceAll(',', '.'),
    );
    final anios = int.tryParse(_controlAnios.text.trim());

    if (aporte == null || aporte <= 0) {
      setState(() => _error = 'Ingresa un aporte mensual valido');
      return;
    }
    if (anios == null || anios <= 0) {
      setState(() => _error = 'Ingresa años validos');
      return;
    }

    widget.onCalcular(EntradaInversion(aporteMensual: aporte, anios: anios));
  }

  @override
  Widget build(BuildContext context) {
    return TarjetaApp(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EncabezadoSeccion(
            titulo: 'Datos de Inversión',
            subtitulo: '10% interés anual, aporte mensual fijo',
          ),
          CampoEtiquetado(
            controlador: _controlAporte,
            etiqueta: 'Aporte mensual (usd)',
            hint: 'ej: 100',
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
          CampoEtiquetado(
            controlador: _controlAnios,
            etiqueta: 'Años de inversión',
            hint: 'ej: 5',
            keyboardType: TextInputType.number,
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
