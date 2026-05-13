import 'package:flutter/material.dart';

import '../diseno_atomico/organismos/formulario_caja_registradora.dart';
import '../diseno_atomico/organismos/resultado_caja_registradora.dart';
import '../diseno_atomico/plantillas/plantilla_scaffold.dart';
import '../dominio/calculo_caja_registradora.dart';

class PaginaCajaRegistradora extends StatefulWidget {
  const PaginaCajaRegistradora({super.key});

  @override
  State<PaginaCajaRegistradora> createState() => _PaginaCajaRegistradoraState();
}

class _PaginaCajaRegistradoraState extends State<PaginaCajaRegistradora> {
  final _scrollController = ScrollController();
  ResultadoCajaRegistradora? _resultado;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _bajarAResultado() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return PlantillaScaffold(
      titulo: 'Caja Registradora',
      scrollController: _scrollController,
      child: Column(
        children: [
          FormularioCajaRegistradora(
            onCalcular: (entrada) {
              setState(() {
                _resultado = calcularCajaRegistradora(entrada);
              });
              _bajarAResultado();
            },
          ),
          const SizedBox(height: 16),
          if (_resultado != null)
            ResultadoCajaRegistradoraWidget(resultado: _resultado!),
        ],
      ),
    );
  }
}