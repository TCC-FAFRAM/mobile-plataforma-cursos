import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class GlobalContext {
  GlobalContext._();

  late final GlobalKey<NavigatorState> _navigatorKey;

  static GlobalContext? _instance;

  static GlobalContext get instance {
    _instance ??= GlobalContext._();
    return _instance!;
  }

  set navigatorKey(GlobalKey<NavigatorState> navigatorKey) {
    _navigatorKey = navigatorKey;
  }

  Future<void> loginExpire() async {
    showTopSnackBar(
      _navigatorKey.currentState!.overlay!,
      const CustomSnackBar.error(
        message: 'Login Expirado',
      ),
    );

    // _navigatorKey.currentState!.popUntil(
    //   ModalRoute.withName(AppRouters.login),
    // );
  }
}
