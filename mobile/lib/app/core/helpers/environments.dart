import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../local_storage/shared_preferences/app_local_storage_impl.dart';
import 'constants.dart';

class Environments {
  Environments._();

  late Map<String, String?> _paramsList;

  static Environments? _instance;

  static Environments get instance {
    _instance ??= Environments._();
    return _instance!;
  }

  String? param(String paramName) {
    if (kReleaseMode) {
      return _paramsList[paramName];
    } else {
      return dotenv.env[paramName];
    }
  }

  Future<void> loadEnvs() async {
    await dotenv.load(); // Certifique-se de carregar as variáveis de ambiente
    final localStorage = AppLocalStorageImpl();
    final baseUrl = await localStorage.read(Constants.ENV_REST_BASE_URL_KEY);
    final connectTimeout =
        await localStorage.read(Constants.ENV_REST_CLIENT_CONNECT_TIMEOUT);
    final receivedTimeout =
        await localStorage.read(Constants.ENV_REST_CLIENT_RECEIVE_TIMEOUT);

    _paramsList = ({
      Constants.ENV_REST_BASE_URL_KEY: baseUrl,
      Constants.ENV_REST_CLIENT_CONNECT_TIMEOUT: connectTimeout ?? '60000',
      Constants.ENV_REST_CLIENT_RECEIVE_TIMEOUT: receivedTimeout ?? '60000',
    });
  }
}
