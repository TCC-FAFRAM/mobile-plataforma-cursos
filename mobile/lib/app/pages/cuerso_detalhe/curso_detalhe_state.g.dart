// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curso_detalhe_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension CursoDetalheStateStatusMatch on CursoDetalheStateStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() loaded,
      required T Function() error}) {
    final v = this;
    if (v == CursoDetalheStateStatus.initial) {
      return initial();
    }

    if (v == CursoDetalheStateStatus.loading) {
      return loading();
    }

    if (v == CursoDetalheStateStatus.loaded) {
      return loaded();
    }

    if (v == CursoDetalheStateStatus.error) {
      return error();
    }

    throw Exception(
        'CursoDetalheStateStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? loaded,
      T Function()? error}) {
    final v = this;
    if (v == CursoDetalheStateStatus.initial && initial != null) {
      return initial();
    }

    if (v == CursoDetalheStateStatus.loading && loading != null) {
      return loading();
    }

    if (v == CursoDetalheStateStatus.loaded && loaded != null) {
      return loaded();
    }

    if (v == CursoDetalheStateStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
