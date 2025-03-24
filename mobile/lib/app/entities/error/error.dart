

// ignore_for_file: public_member_api_docs, sort_constructors_first
final class ErrorVersion {
  final String? appVersion;
  final String? error;
  final String? motivo;
  final List<dynamic>? produtos;

  ErrorVersion({
     this.appVersion,
     this.error,
     this.motivo,
     this.produtos
  });
  

  factory ErrorVersion.fromMap(Map<String, dynamic> map) {
    return ErrorVersion(
      appVersion: map['appversion'] != null ? map['appversion'] as String : null,
      error: map['error'] != null ? map['error'] as String : null,
      motivo: map['Motivo'] != null ? map['Motivo'] as String : null,
      produtos: map['Produtos'] != null ? map['Produtos'] as List<dynamic> : [],
    );
  }

   }
