// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AcessModel {
  final String? token;
  final DateTime? acessoem;

  AcessModel({
    this.token,
    this.acessoem,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'acessoem': acessoem?.millisecondsSinceEpoch,
    };
  }

  factory AcessModel.fromMap(Map<String, dynamic> map) {
    return AcessModel(
      token: map['token'] != null ? map['token'] as String : null,
      acessoem: map['acessoem'] != null
          ? DateTime.tryParse(map['acessoem'] as String)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AcessModel.fromJson(String source) =>
      AcessModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
