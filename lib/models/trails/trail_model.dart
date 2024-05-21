// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../user/userpost_model.dart';

class TrailModel {
  String? description;
  String? files;
  int? id;
  String? name;
  String? occupation;
  UserPostModel? user;
  int? comentarios;
  TrailModel({
    this.description,
    this.files,
    this.id,
    this.name,
    this.occupation,
    this.user,
    this.comentarios,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'files': files,
      'id': id,
      'name': name,
      'occupation': occupation,
      'user': user?.toMap(),
      'comentarios': comentarios,
    };
  }

  factory TrailModel.fromMap(Map<String, dynamic> map) {
    return TrailModel(
      description: map['description'] != null ? map['description'] as String : null,
      files: map['files'] != null ? map['files'] as String : null,
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      occupation: map['occupation'] != null ? map['occupation'] as String : null,
      user: map['user'] != null ? UserPostModel.fromMap(map['user'] as Map<String,dynamic>) : null,
      comentarios: map['comentarios'] != null ? map['comentarios'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TrailModel.fromJson(String source) => TrailModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
