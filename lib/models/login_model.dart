// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginModel {
  final String username;
  final String senha;

  LoginModel(this.username, this.senha);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'senha': senha,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      map['username'] as String,
      map['senha'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
