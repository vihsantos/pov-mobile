// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserPostModel {
  final int id;
  final String username;
  // ignore: non_constant_identifier_names
  final String usericon_url;

  UserPostModel(this.id, this.username, this.usericon_url);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'usericon_url': usericon_url,
    };
  }

  factory UserPostModel.fromMap(Map<String, dynamic> map) {
    return UserPostModel(
      map['id'] as int,
      map['username'] as String,
      map['usericon_url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserPostModel.fromJson(String source) =>
      UserPostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
