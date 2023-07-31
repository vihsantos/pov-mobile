// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pov/models/post/comment_model.dart';
import 'package:pov/models/user/userpost_model.dart';
import 'package:pov/models/user/uservoos_model.dart';

class PostModel {
  final String id;
  final String descricao;
  final String imageUrl;
  final int stars;
  final List<CommentModel> comments;
  final List<UserVoosModel> voos;
  final UserPostModel user;

  PostModel(this.id, this.descricao, this.imageUrl, this.stars, this.comments,
      this.voos, this.user);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'descricao': descricao,
      'imageUrl': imageUrl,
      'stars': stars,
      'comments': comments.map((x) => x.toMap()).toList(),
      'voos': voos.map((x) => x.toMap()).toList(),
      'user': user.toMap(),
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      map['id'] as String,
      map['descricao'] as String,
      map['imageUrl'] as String,
      map['stars'] as int,
      List<CommentModel>.from(
        (map['comments'] as List<int>).map<CommentModel>(
          (x) => CommentModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      List<UserVoosModel>.from(
        (map['voos'] as List<int>).map<UserVoosModel>(
          (x) => UserVoosModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      UserPostModel.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
