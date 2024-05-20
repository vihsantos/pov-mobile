import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MunicipioDTO {
  int? id;
  String? nome;
  
  MunicipioDTO({
    this.id,
    this.nome,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
    };
  }

  factory MunicipioDTO.fromMap(Map<String, dynamic> map) {
    return MunicipioDTO(
      id: map['id'] != null ? map['id'] as int : null,
      nome: map['nome'] != null ? map['nome'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MunicipioDTO.fromJson(String source) => MunicipioDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
