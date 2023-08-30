import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserProfileModel {
  int? id;
  String? username;
  String? profileicon;
  UserProfileModel({
    this.id,
    this.username,
    this.profileicon,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'profileicon': profileicon,
    };
  }

  factory UserProfileModel.fromMap(Map<String, dynamic> map) {
    return UserProfileModel(
      id: map['id'] != null ? map['id'] as int : null,
      username: map['username'] != null ? map['username'] as String : null,
      profileicon: map['profileicon'] != null ? map['profileicon'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfileModel.fromJson(String source) => UserProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
