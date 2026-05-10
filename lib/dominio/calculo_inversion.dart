class ResultadoInversion {
  final int meses;
  final double aporteMensual;
  final double aportesTotales;
  final double montoFinal;
  final double interesGanado;

  const ResultadoInversion({
    required this.meses,
    required this.aporteMensual,
    required this.aportesTotales,
    required this.montoFinal,
    required this.interesGanado,
  });
}

ResultadoInversion calcularInversion({
  required double aporteMensual,
  required int anios,
}) {
  final meses = anios * 12;
  final tasaMensual = 0.10 / 12.0;

  // Valor futuro de una anualidad: PMT * (( (1+r)^n - 1 ) / r)
  final acumulado = tasaMensual == 0
      ? aporteMensual * meses
      : aporteMensual * ((potencia1p(tasaMensual, meses) - 1) / tasaMensual);

  final aportesTotales = aporteMensual * meses;
  return ResultadoInversion(
    meses: meses,
    aporteMensual: aporteMensual,
    aportesTotales: aportesTotales,
    montoFinal: acumulado,
    interesGanado: acumulado - aportesTotales,
  );
}

double potencia1p(double tasa, int n) {
  var acc = 1.0;
  for (var i = 0; i < n; i++) {
    acc *= (1.0 + tasa);
  }
  return acc;
}
