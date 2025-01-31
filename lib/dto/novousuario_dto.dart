import 'dart:convert';
// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names

class NovoUsuarioDTO {
  String? nome;
  String? email;
  String? username;
  String? password;
  DateTime? data_nascimento;
  bool? guide;
  String? cadastur;
  String? areatuacao;
  DateTime? data_vencimento;
  String? estado;
  String? municipio;
  
  NovoUsuarioDTO({
    this.nome,
    this.email,
    this.username,
    this.password,
    this.data_nascimento,
    this.guide,
    this.cadastur,
    this.areatuacao,
    this.data_vencimento,
    this.estado,
    this.municipio,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'email': email,
      'username': username,
      'password': password,
      'data_nascimento': data_nascimento?.toString(),
      'guide': guide,
      'cadastur': cadastur,
      'areatuacao': areatuacao,
      'data_vencimento': data_vencimento?.toString(),
      'estado': estado,
      'municipio': municipio,
    };
  }

  factory NovoUsuarioDTO.fromMap(Map<String, dynamic> map) {
    return NovoUsuarioDTO(
      nome: map['nome'] != null ? map['nome'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      data_nascimento: map['data_nascimento'] != null ? DateTime.parse(map['data_nascimento'] as String) : null,
      guide: map['guide'] != null ? map['guide'] as bool : null,
      cadastur: map['cadastur'] != null ? map['cadastur'] as String : null,
      areatuacao: map['areatuacao'] != null ? map['areatuacao'] as String : null,
      data_vencimento: map['data_vencimento'] != null ? DateTime.parse(map['data_vencimento'] as String) : null,
      estado: map['estado'] != null ? map['estado'] as String : null,
      municipio: map['municipio'] != null ? map['municipio'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NovoUsuarioDTO.fromJson(String source) => NovoUsuarioDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
