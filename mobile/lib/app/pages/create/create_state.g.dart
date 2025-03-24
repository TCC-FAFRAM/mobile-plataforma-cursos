// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension CreateStateStatusMatch on CreateStateStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() loaded,
      required T Function() error,
      required T Function() sucess,
      required T Function() warning,
      required T Function() typeUser}) {
    final v = this;
    if (v == CreateStateStatus.initial) {
      return initial();
    }

    if (v == CreateStateStatus.loading) {
      return loading();
    }

    if (v == CreateStateStatus.loaded) {
      return loaded();
    }

    if (v == CreateStateStatus.error) {
      return error();
    }

    if (v == CreateStateStatus.sucess) {
      return sucess();
    }

    if (v == CreateStateStatus.warning) {
      return warning();
    }

    if (v == CreateStateStatus.typeUser) {
      return typeUser();
    }

    throw Exception(
        'CreateStateStatus.match failed, found no match for: $this');
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
    if (v == CreateStateStatus.initial && initial != null) {
      return initial();
    }

    if (v == CreateStateStatus.loading && loading != null) {
      return loading();
    }

    if (v == CreateStateStatus.loaded && loaded != null) {
      return loaded();
    }

    if (v == CreateStateStatus.error && error != null) {
      return error();
    }

    if (v == CreateStateStatus.sucess && sucess != null) {
      return sucess();
    }

    if (v == CreateStateStatus.warning && warning != null) {
      return warning();
    }

    if (v == CreateStateStatus.typeUser && typeUser != null) {
      return typeUser();
    }

    return any();
  }
}
