import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserPostModel {
  int? id;
  String? username;

  UserPostModel({this.id, this.username});
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
    };
  }

  factory UserPostModel.fromMap(Map<String, dynamic> map) {
    return UserPostModel(
      id: map['id'] != null ? map['id'] as int : null,
      username: map['username'] != null ? map['username'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserPostModel.fromJson(String source) => UserPostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
