class AppRoutersRemote {
  AppRoutersRemote._();
  static String splash = '/splash';

  static String baseUrl = '/api';
  static String healtcheck = '$baseUrl/healtcheck';

  static String usuarioLogin = '$baseUrl/auth/login';
  static String usuarioCreate = '$baseUrl/auth/register';

  static String cursos = '$baseUrl/curso/usuario';
}
