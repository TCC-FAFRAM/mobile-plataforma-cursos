import '../../core/helpers/constants.dart';

enum TipoFiltroTokenDTO {
  accessToken,
  refreshToken,
}

extension TipoFiltroTokenDTOKeyValue on TipoFiltroTokenDTO {
  String get keyValue {
    switch (this) {
      case TipoFiltroTokenDTO.accessToken:
        return Constants.LOCAL_STORAGE_ACCESS_TOKEN_KEY;
      case TipoFiltroTokenDTO.refreshToken:
        return Constants.LOCAL_STORAGE_REFRESH_TOKEN_KEY;
    }
  }
}
