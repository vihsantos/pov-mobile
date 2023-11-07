// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../user/userpost_model.dart';

class TrailModel {
  int? id;
  String? files;
  String? description;
  UserPostModel? user;
  String? occupation;
  String? name;
  TrailModel({
    this.id,
    this.files,
    this.description,
    this.user,
    this.occupation,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'files': files,
      'description': description,
      'user': user?.toJson(),
      'occupation': occupation,
      'name': name,
    };
  }

  factory TrailModel.fromMap(Map<String, dynamic> map) {
    return TrailModel(
      id: map['id'] != null ? map['id'] as int : null,
      files: map['files'] != null ? map['files'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      user: map['user'] != null
          ? UserPostModel.fromJson(map['user'] as Map<String, dynamic>)
          : null,
      occupation:
          map['occupation'] != null ? map['occupation'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TrailModel.fromJson(String source) =>
      TrailModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
