// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore_for_file: non_constant_identifier_names

class AcessModel {
  final String? token;
  final int? user_id;

  AcessModel(this.token, this.user_id);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'user_id': user_id,
    };
  }

  factory AcessModel.fromMap(Map<String, dynamic> map) {
    return AcessModel(
      map['token'] != null ? map['token'] as String : null,
      map['user_id'] != null ? map['user_id'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AcessModel.fromJson(String source) =>
      AcessModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
