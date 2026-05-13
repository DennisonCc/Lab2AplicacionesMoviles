class EntradaVentasMonto {
  final int cantidadVentas;
  final List<double> ventas;

  const EntradaVentasMonto({
    required this.cantidadVentas,
    required this.ventas,
  });
}

class ResultadoVentasMonto {
  final int ventasMenorOIgual10000;
  final double montoMenorOIgual10000;
  final int ventasEntre10001Y19999;
  final double montoEntre10001Y19999;
  final int ventasMayorOIgual20000;
  final double montoMayorOIgual20000;
  final int totalVentas;
  final double montoGlobal;

  const ResultadoVentasMonto({
    required this.ventasMenorOIgual10000,
    required this.montoMenorOIgual10000,
    required this.ventasEntre10001Y19999,
    required this.montoEntre10001Y19999,
    required this.ventasMayorOIgual20000,
    required this.montoMayorOIgual20000,
    required this.totalVentas,
    required this.montoGlobal,
  });
}

ResultadoVentasMonto calcularVentasMonto(EntradaVentasMonto entrada) {
  var ventasMenorOIgual10000 = 0;
  var montoMenorOIgual10000 = 0.0;
  var ventasEntre10001Y19999 = 0;
  var montoEntre10001Y19999 = 0.0;
  var ventasMayorOIgual20000 = 0;
  var montoMayorOIgual20000 = 0.0;
  var montoGlobal = 0.0;

  for (final venta in entrada.ventas) {
    montoGlobal += venta;
    if (venta <= 10000) {
      ventasMenorOIgual10000++;
      montoMenorOIgual10000 += venta;
    } else if (venta < 20000) {
      ventasEntre10001Y19999++;
      montoEntre10001Y19999 += venta;
    } else {
      ventasMayorOIgual20000++;
      montoMayorOIgual20000 += venta;
    }
  }

  return ResultadoVentasMonto(
    ventasMenorOIgual10000: ventasMenorOIgual10000,
    montoMenorOIgual10000: montoMenorOIgual10000,
    ventasEntre10001Y19999: ventasEntre10001Y19999,
    montoEntre10001Y19999: montoEntre10001Y19999,
    ventasMayorOIgual20000: ventasMayorOIgual20000,
    montoMayorOIgual20000: montoMayorOIgual20000,
    totalVentas: entrada.cantidadVentas,
    montoGlobal: montoGlobal,
  );
}