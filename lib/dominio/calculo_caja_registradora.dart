class EntradaCajaRegistradora {
  final Map<int, int> cantidadesBilletes;
  final Map<int, int> cantidadesMonedasCentavos;

  const EntradaCajaRegistradora({
    required this.cantidadesBilletes,
    required this.cantidadesMonedasCentavos,
  });
}

class ResultadoCajaRegistradora {
  final int totalPiezasBilletes;
  final double totalBilletes;
  final int totalPiezasMonedas;
  final double totalMonedas;
  final double totalGeneral;

  const ResultadoCajaRegistradora({
    required this.totalPiezasBilletes,
    required this.totalBilletes,
    required this.totalPiezasMonedas,
    required this.totalMonedas,
    required this.totalGeneral,
  });
}

ResultadoCajaRegistradora calcularCajaRegistradora(
  EntradaCajaRegistradora entrada,
) {
  var totalPiezasBilletes = 0;
  var totalBilletes = 0.0;
  for (final item in entrada.cantidadesBilletes.entries) {
    totalPiezasBilletes += item.value;
    totalBilletes += item.key * item.value;
  }

  var totalPiezasMonedas = 0;
  var totalMonedas = 0.0;
  for (final item in entrada.cantidadesMonedasCentavos.entries) {
    totalPiezasMonedas += item.value;
    totalMonedas += (item.key / 100.0) * item.value;
  }

  final totalGeneral = totalBilletes + totalMonedas;

  return ResultadoCajaRegistradora(
    totalPiezasBilletes: totalPiezasBilletes,
    totalBilletes: totalBilletes,
    totalPiezasMonedas: totalPiezasMonedas,
    totalMonedas: totalMonedas,
    totalGeneral: totalGeneral,
  );
}