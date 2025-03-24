// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aula_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension AulaStateStatusMatch on AulaStateStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() loaded,
      required T Function() error}) {
    final v = this;
    if (v == AulaStateStatus.initial) {
      return initial();
    }

    if (v == AulaStateStatus.loading) {
      return loading();
    }

    if (v == AulaStateStatus.loaded) {
      return loaded();
    }

    if (v == AulaStateStatus.error) {
      return error();
    }

    throw Exception('AulaStateStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? loaded,
      T Function()? error}) {
    final v = this;
    if (v == AulaStateStatus.initial && initial != null) {
      return initial();
    }

    if (v == AulaStateStatus.loading && loading != null) {
      return loading();
    }

    if (v == AulaStateStatus.loaded && loaded != null) {
      return loaded();
    }

    if (v == AulaStateStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
