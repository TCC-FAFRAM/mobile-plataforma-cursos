enum AppConnectivityStatus { connected, disconnected }

abstract interface class AppConnectivity {
  Future<AppConnectivityStatus> checkConnect();
}
