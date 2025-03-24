import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../connectivity/app_connectivity.dart';
import '../connectivity/app_connectivity_impl.dart';
import '../cubit/string_cubit.dart';

import '../jwt/app_jwt.dart';
import '../jwt/app_jwt_impl.dart';
import '../launcher/app_launcher.dart';
import '../launcher/app_launcher_impl.dart';
import '../local_image_storage/app_local_image_storage.dart';
import '../local_image_storage/app_local_image_storage_impl.dart';
import '../local_pdf_storage/local_pdf_storage.dart';
import '../local_pdf_storage/local_pdf_storage_impl.dart';
import '../local_storage/app_local_storage.dart';

import '../local_storage/flutter_secure_storage/app_local_secure_storage_impl.dart';
import '../local_storage/shared_preferences/app_local_storage_impl.dart';
import '../logger/app_logger.dart';
import '../logger/app_logger_impl.dart';
import '../rest_client/app_rest_client.dart';
import '../rest_client/dio/app_rest_client_impl.dart';

List<SingleChildWidget> applicationBindings = [
  Provider<StringCubit>(
    create: (context) => StringCubit(),
  ),
  Provider<AppLocalStorage>(
    create: (context) => AppLocalStorageImpl(),
  ),
  Provider<AppLogger>(
    create: (context) => AppLoggerImpl(),
  ),
  Provider<AppConnectivity>(
    create: (context) => AppConnectivityImpl(),
  ),
  Provider<AppLauncher>(
    create: (context) => AppLauncherImpl(),
  ),
  Provider<AppLocalSecureStorage>(
    create: (context) => AppLocalSecureStorageImpl(),
  ),
  Provider<AppRestClient>(
    create: (context) => AppRestClientImpl(
      localSecureStorage: context.read(),
      localStorage: context.read(),
      log: context.read(),
      connectivity: context.read(),
    ),
  ),
  Provider<AppLocalImageStorage>(
    create: (context) => AppLocalImageStorageImpl(
      restClient: context.read(),
      logger: context.read(),
    ),
  ),
  Provider<AppPdfStorage>(
    create: (context) => AppPdfStorageImpl(
      restClient: context.read(),
      logger: context.read(),
    ),
  ),
  Provider<AppJwt>(
    create: (context) => AppJwtImpl(),
  ),
  Provider<AppJwt>(
    create: (context) => AppJwtImpl(),
  ),
];
