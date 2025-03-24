sealed class Constants {
  static const DATABASE_VERSION = 3;
  static const DATABASE_VERSION_STORAGE = 'database_version_storage';
  static const DATABASE_NAME = 'app.db';

  static const GOOGLE_VERSION = 'google_version';
  static const GOOGLE_URL = 'google_url';
  static const APPLE_VERSION = 'apple_version';
  static const APPLE_URL = 'apple_url';

  static const LOCAL_USUARIO_EMAIL = 'local_usuario';
  static const LOCAL_USUARIO_TIPO = 'local_usuario';
  static const LOCAL_USUARIO_NOME = 'local_usuario';

  static const ENV_REST_CLIENT_CONNECT_TIMEOUT = 'rest_client_connect_timeout';
  static const ENV_REST_CLIENT_RECEIVE_TIMEOUT = 'rest_client_receive_timeout';
  static const ENV_REST_BASE_URL_KEY = 'base_url';
  static const ENV_REST_AUTH_REQUIRED_KEY = 'auth_required';
  static const ENV_REST_FORCE_UPDATE = 'force_update';
  static const ENV_REST_ETAG_REQUEST = 'If-None-Match';
  static const ENV_REST_ETAG_RESPONSE_HEADER = 'ETag';
  static const ENV_REST_ETAG_STORAGE = 'ETagPath';
  static const ENV_VERSION_BACKEND = 'versionBackend';

  static const LOCAL_STORAGE_ACCESS_TOKEN_KEY =
      'LOCAL_STORAGE_ACCESS_TOKEN_KEY';
  static const LOCAL_STORAGE_REFRESH_TOKEN_KEY =
      'LOCAL_STORAGE_REFRESH_TOKEN_KEY';
}
