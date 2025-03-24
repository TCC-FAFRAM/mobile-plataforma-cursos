import 'package:url_launcher/url_launcher.dart';

import './app_launcher.dart';

class AppLauncherImpl implements AppLauncher {
  @override
  void goUrl(String url) {
    launchUrl(Uri.parse(url));
  }
}
