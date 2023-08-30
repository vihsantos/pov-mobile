// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class GuideModel {
  String? areaatuacao;
  String? cod_cadastur;
  GuideModel({
    this.areaatuacao,
    this.cod_cadastur,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'areaatuacao': areaatuacao,
      'cod_cadastur': cod_cadastur,
    };
  }

  factory GuideModel.fromMap(Map<String, dynamic> map) {
    return GuideModel(
      areaatuacao: map['areaatuacao'] != null ? map['areaatuacao'] as String : null,
      cod_cadastur: map['cod_cadastur'] != null ? map['cod_cadastur'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GuideModel.fromJson(String source) => GuideModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
