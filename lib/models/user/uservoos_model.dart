// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserVoosModel {
  final int id;
  final int post_id;
  final int user_id;

  UserVoosModel(this.id, this.post_id, this.user_id);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'post_id': post_id,
      'user_id': user_id
    };
  }

  factory UserVoosModel.fromMap(Map<String, dynamic> map) {
    return UserVoosModel(
      map['id'] as int,
      map['post_id'] as int,
      map['user_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserVoosModel.fromJson(String source) =>
      UserVoosModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
