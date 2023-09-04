// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AcessModel {
  final String? token;
  final int? userid;
  final bool? guide;

  AcessModel( {
    this.token,
    this.userid, 
    this.guide,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'userid': userid,
      'guide': guide,
    };
  }

  factory AcessModel.fromMap(Map<String, dynamic> map) {
    return AcessModel(
      token: map['token'] != null ? map['token'] as String : null,
      userid: map['userid'] != null ? map['userid'] as int : null,
      guide: map['guide'] != null ? map['guide'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AcessModel.fromJson(String source) =>
      AcessModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
