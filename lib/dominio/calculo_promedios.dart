class ResultadoSalon {
  final int indiceSalon;
  final int cantidadAlumnos;
  final double promedio;

  const ResultadoSalon({
    required this.indiceSalon,
    required this.cantidadAlumnos,
    required this.promedio,
  });
}

class ResultadoPromedios {
  final List<ResultadoSalon> porSalon;
  final double promedioGeneral;
  final int totalAlumnos;

  const ResultadoPromedios({
    required this.porSalon,
    required this.promedioGeneral,
    required this.totalAlumnos,
  });
}

ResultadoPromedios calcularPromedios(List<List<int>> edadesPorSalon) {
  final resultados = <ResultadoSalon>[];
  var sumaGlobal = 0;
  var totalAlumnos = 0;

  for (var i = 0; i < edadesPorSalon.length; i++) {
    final edades = edadesPorSalon[i];
    final n = edades.length;
    final suma = edades.fold<int>(0, (acc, e) => acc + e);
    final promedio = n == 0 ? 0.0 : suma / n;
    resultados.add(
      ResultadoSalon(
        indiceSalon: i + 1,
        cantidadAlumnos: n,
        promedio: promedio,
      ),
    );
    sumaGlobal += suma;
    totalAlumnos += n;
  }

  final promedioGeneral = totalAlumnos == 0 ? 0.0 : sumaGlobal / totalAlumnos;
  return ResultadoPromedios(
    porSalon: resultados,
    promedioGeneral: promedioGeneral,
    totalAlumnos: totalAlumnos,
  );
}
