// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
// ignore_for_file: public_member_api_docs, sort_constructors_first
class InfoGuideDTO {
  String? cod_cadastur;
  DateTime? data_vencimento;
  String? areaatuacao;
  String? estado;
  String? municipio;
  String? contato;
  
  InfoGuideDTO({
    this.cod_cadastur,
    this.data_vencimento,
    this.areaatuacao,
    this.estado,
    this.municipio,
    this.contato
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cod_cadastur': cod_cadastur,
      'data_vencimento': data_vencimento?.millisecondsSinceEpoch,
      'areaatuacao': areaatuacao,
      'estado': estado,
      'municipio': municipio,
      'contato': contato
    };
  }

  factory InfoGuideDTO.fromMap(Map<String, dynamic> map) {
    return InfoGuideDTO(
      cod_cadastur: map['cod_cadastur'] != null ? map['cod_cadastur'] as String : null,
      data_vencimento: map['data_vencimento'] != null ? DateTime.tryParse(map['data_vencimento'] as String) : null,
      areaatuacao: map['areaatuacao'] != null ? map['areaatuacao'] as String : null,
      estado: map['estado'] != null ? map['estado'] as String : null,
      municipio: map['municipio'] != null ? map['municipio'] as String : null,
      contato: map['contato'] != null ? map['contato'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory InfoGuideDTO.fromJson(String source) => InfoGuideDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
