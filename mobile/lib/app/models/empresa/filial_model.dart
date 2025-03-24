final class FilialModel {
  int empresa;
  int codigo;
  String nomeFantasia;
  FilialModel({
    required this.empresa,
    required this.codigo,
    required this.nomeFantasia,
  });

  @override
  bool operator ==(covariant FilialModel other) {
    if (identical(this, other)) return true;

    return other.empresa == empresa &&
        other.codigo == codigo &&
        other.nomeFantasia == nomeFantasia;
  }

  @override
  int get hashCode =>
      empresa.hashCode ^ codigo.hashCode ^ nomeFantasia.hashCode;
}
