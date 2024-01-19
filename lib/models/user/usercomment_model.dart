import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserComment {
  final int? id;
  final String? username;

  UserComment(
    this.id,
    this.username,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
    };
  }

  factory UserComment.fromMap(Map<String, dynamic> map) {
    return UserComment(
      map['id'] != null ? map['id'] as int : null,
      map['username'] != null ? map['username'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserComment.fromJson(String source) =>
      UserComment.fromMap(json.decode(source) as Map<String, dynamic>);
}
