class EntradaVenta {
  final double subtotal;
  EntradaVenta(this.subtotal);
}

class ResultadoVenta {
  final double subtotal;
  final double descuento;
  final double baseImponible;
  final double iva;
  final double total;

  // Comision: 10% del subtotal (antes de descuento e iva)
  final double sueldoVendedor;

  const ResultadoVenta({
    required this.subtotal,
    required this.descuento,
    required this.baseImponible,
    required this.iva,
    required this.total,
    required this.sueldoVendedor,
  });
}

ResultadoVenta calcularVenta(EntradaVenta entrada) {
  final subtotal = entrada.subtotal;
  final descuento = subtotal > 2000 ? subtotal * 0.20 : 0.0;
  final baseImponible = subtotal - descuento;
  final iva = baseImponible * 0.15;
  final total = baseImponible + iva;
  final sueldoVendedor = subtotal * 0.10;
  return ResultadoVenta(
    subtotal: subtotal,
    descuento: descuento,
    baseImponible: baseImponible,
    iva: iva,
    total: total,
    sueldoVendedor: sueldoVendedor,
  );
}
