# AGENTS.md

- Repo: aplicacion Flutter unica (no monorepo). Entrypoint: `lib/main.dart`.
- Estructura de UI sigue Atomic Design en `lib/diseno_atomico/` y pantallas en `lib/paginas/`.

## Comandos

- Instalar deps: `flutter pub get`
- Ejecutar app: `flutter run`
- Analisis (lints): `flutter analyze`
- Tests: `flutter test`
- Un test: `flutter test test/widget_test.dart`
- Formato: `dart format .`

## Convenciones del repo

- Codigo y textos: espanol sin tildes/ni `ñ` (solo ASCII). Ej: `anios`, `salon`, `inversion`.

## Notas Android

- Android compila con Java/Kotlin 17 (ver `android/app/build.gradle.kts`).
- Salidas de build Android se redirigen a `build/` en la raiz (ver `android/build.gradle.kts`).

## Gotchas

- `.metadata` esta versionado y no se edita manualmente.
