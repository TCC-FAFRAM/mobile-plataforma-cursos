import 'package:jwt_decoder/jwt_decoder.dart';

import './app_jwt.dart';

class AppJwtImpl implements AppJwt {
  @override
  DateTime expirationDate(String token) {
    return JwtDecoder.getExpirationDate(token);
  }

  @override
  Duration getTokenTime(String token) {
    return JwtDecoder.getTokenTime(token);
  }

  @override
  bool isExpired(String? token) {
    if (token == null || token == '') {
      return true;
    }

    return JwtDecoder.isExpired(token);
  }
}
