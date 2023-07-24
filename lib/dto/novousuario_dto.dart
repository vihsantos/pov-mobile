import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names

class NovoUsuarioDTO {
  final String? nome;
  final String? email;
  final String? username;
  final DateTime? data_nascimento;
  final bool? guide;

  NovoUsuarioDTO({
    this.nome,
    this.email,
    this.username,
    this.data_nascimento,
    this.guide,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'email': email,
      'username': username,
      'data_nascimento': data_nascimento?.millisecondsSinceEpoch,
      'guide': guide,
    };
  }

  factory NovoUsuarioDTO.fromMap(Map<String, dynamic> map) {
    return NovoUsuarioDTO(
      nome: map['nome'] != null ? map['nome'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      data_nascimento: map['data_nascimento'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['data_nascimento'] as int)
          : null,
      guide: map['guide'] != null ? map['guide'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NovoUsuarioDTO.fromJson(String source) =>
      NovoUsuarioDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
