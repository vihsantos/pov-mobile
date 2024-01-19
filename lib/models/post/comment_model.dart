// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pov/models/user/usercomment_model.dart';

class CommentModel {
  final int id;
  final String description;
  final UserComment user;

  CommentModel(this.id, this.description, this.user);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'user': user.toMap(),
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      map['id'] as int,
      map['description'] as String,
      UserComment.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) =>
      CommentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
