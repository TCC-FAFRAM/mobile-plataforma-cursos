import 'package:connectivity_plus/connectivity_plus.dart';

import 'app_connectivity.dart';

class AppConnectivityImpl implements AppConnectivity {
  @override
  Future<AppConnectivityStatus> checkConnect() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return AppConnectivityStatus.connected;
    } else {
      return AppConnectivityStatus.disconnected;
    }
  }
}
