abstract interface class AppJwt {
  bool isExpired(String? token);
  DateTime expirationDate(String token);
  Duration getTokenTime(String token);
}
