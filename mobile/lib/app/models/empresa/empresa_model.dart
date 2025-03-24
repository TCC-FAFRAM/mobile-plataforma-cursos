final class EmpresaModel {
  int empresa;
  int codigo;
  String nomeFantasia;
  EmpresaModel({
    required this.empresa,
    required this.codigo,
    required this.nomeFantasia,
  });

  @override
  bool operator ==(covariant EmpresaModel other) {
    if (identical(this, other)) return true;

    return other.empresa == empresa &&
        other.codigo == codigo &&
        other.nomeFantasia == nomeFantasia;
  }

  @override
  int get hashCode =>
      empresa.hashCode ^ codigo.hashCode ^ nomeFantasia.hashCode;
}
