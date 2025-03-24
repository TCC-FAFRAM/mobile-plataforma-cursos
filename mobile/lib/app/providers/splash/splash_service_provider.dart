import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../services/splash/splash_service.dart';
import '../../services/splash/splash_service_impl.dart';

List<SingleChildWidget> splashProviderService = [
  Provider<SplashService>(
    create: (context) => SplashServiceImpl(
      logger: context.read(),
      localStorage: context.read(),
      jwt: context.read(),
    ),
  ),
];
