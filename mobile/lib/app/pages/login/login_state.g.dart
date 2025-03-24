// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension LoginStateStatusMatch on LoginStateStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() loaded,
      required T Function() error,
      required T Function() sucess,
      required T Function() warning,
      required T Function() typeUser}) {
    final v = this;
    if (v == LoginStateStatus.initial) {
      return initial();
    }

    if (v == LoginStateStatus.loading) {
      return loading();
    }

    if (v == LoginStateStatus.loaded) {
      return loaded();
    }

    if (v == LoginStateStatus.error) {
      return error();
    }

    if (v == LoginStateStatus.sucess) {
      return sucess();
    }

    if (v == LoginStateStatus.warning) {
      return warning();
    }

    if (v == LoginStateStatus.typeUser) {
      return typeUser();
    }

    throw Exception('LoginStateStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? loaded,
      T Function()? error,
      T Function()? sucess,
      T Function()? warning,
      T Function()? typeUser}) {
    final v = this;
    if (v == LoginStateStatus.initial && initial != null) {
      return initial();
    }

    if (v == LoginStateStatus.loading && loading != null) {
      return loading();
    }

    if (v == LoginStateStatus.loaded && loaded != null) {
      return loaded();
    }

    if (v == LoginStateStatus.error && error != null) {
      return error();
    }

    if (v == LoginStateStatus.sucess && sucess != null) {
      return sucess();
    }

    if (v == LoginStateStatus.warning && warning != null) {
      return warning();
    }

    if (v == LoginStateStatus.typeUser && typeUser != null) {
      return typeUser();
    }

    return any();
  }
}
