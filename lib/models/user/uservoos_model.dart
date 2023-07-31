// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserVoosModel {
  final int id;
  // ignore: non_constant_identifier_names
  final int post_id;
  final String username;

  UserVoosModel(this.id, this.post_id, this.username);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'post_id': post_id,
      'username': username,
    };
  }

  factory UserVoosModel.fromMap(Map<String, dynamic> map) {
    return UserVoosModel(
      map['id'] as int,
      map['post_id'] as int,
      map['username'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserVoosModel.fromJson(String source) =>
      UserVoosModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
