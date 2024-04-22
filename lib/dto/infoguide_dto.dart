// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
// ignore_for_file: public_member_api_docs, sort_constructors_first
class InfoGuideDTO {
  String? cod_cadastur;
  DateTime? data_vencimento;
  String? areaatuacao;
  
  InfoGuideDTO({
    this.cod_cadastur,
    this.data_vencimento,
    this.areaatuacao,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cod_cadastur': cod_cadastur,
      'data_vencimento': data_vencimento?.millisecondsSinceEpoch,
      'areaatuacao': areaatuacao,
    };
  }

  factory InfoGuideDTO.fromMap(Map<String, dynamic> map) {
    return InfoGuideDTO(
      cod_cadastur: map['cod_cadastur'] != null ? map['cod_cadastur'] as String : null,
      data_vencimento: map['data_vencimento'] != null ? DateTime.fromMillisecondsSinceEpoch(map['data_vencimento'] as int) : null,
      areaatuacao: map['areaatuacao'] != null ? map['areaatuacao'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory InfoGuideDTO.fromJson(String source) => InfoGuideDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
