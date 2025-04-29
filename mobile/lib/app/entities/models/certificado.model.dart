// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CertificadoModel {
  final int idCertificado;
  final int fkIdUsuario;
  final int fkIdCurso;
  final DateTime dataEmissao;
  final String urlCertificado;
  final String status;

  CertificadoModel({
    required this.idCertificado,
    required this.fkIdUsuario,
    required this.fkIdCurso,
    required this.dataEmissao,
    required this.urlCertificado,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_certificado': idCertificado,
      'fk_id_usuario': fkIdUsuario,
      'fk_id_curso': fkIdCurso,
      'data_emissao': dataEmissao.toIso8601String(),
      'url_certificado': urlCertificado,
      'status': status,
    };
  }

  factory CertificadoModel.fromMap(Map<String, dynamic> map) {
    return CertificadoModel(
      idCertificado: map['id_certificado'],
      fkIdUsuario: map['fk_id_usuario'],
      fkIdCurso: map['fk_id_curso'],
      dataEmissao: DateTime.parse(map['data_emissao']),
      urlCertificado: map['url_certificado'],
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CertificadoModel.fromJson(String source) =>
      CertificadoModel.fromMap(json.decode(source));
}
