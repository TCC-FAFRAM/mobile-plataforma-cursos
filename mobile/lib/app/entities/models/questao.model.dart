// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class QuestaoModel {
  final int idQuestao;
  final String pergunta;
  final List<String> opcoes;
  final int respostaCorreta;
  final int peso;

  QuestaoModel({
    required this.idQuestao,
    required this.pergunta,
    required this.opcoes,
    required this.respostaCorreta,
    required this.peso,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_questao': idQuestao,
      'pergunta': pergunta,
      'opcoes': opcoes,
      'resposta_correta': respostaCorreta,
      'peso': peso,
    };
  }

  factory QuestaoModel.fromMap(Map<String, dynamic> map) {
    return QuestaoModel(
      idQuestao: map['id_questao'],
      pergunta: map['pergunta'],
      opcoes: List<String>.from(map['opcoes']),
      respostaCorreta: map['resposta_correta'],
      peso: map['peso'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestaoModel.fromJson(String source) =>
      QuestaoModel.fromMap(json.decode(source));
}
