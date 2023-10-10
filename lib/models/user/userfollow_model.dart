import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserFollowModel {
  int? id;
  String? username;
  UserFollowModel({
    this.id,
    this.username,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
    };
  }

  factory UserFollowModel.fromMap(Map<String, dynamic> map) {
    return UserFollowModel(
      id: map['id'] != null ? map['id'] as int : null,
      username: map['username'] != null ? map['username'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserFollowModel.fromJson(String source) =>
      UserFollowModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
