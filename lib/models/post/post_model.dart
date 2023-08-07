// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pov/models/post/comment_model.dart';
import 'package:pov/models/user/userpost_model.dart';
import 'package:pov/models/user/uservoos_model.dart';

class PostModel {
  final String id;
  final String descricao;
  final String imageUrl;
  final String localizacao;
  final int stars;
  final List<CommentModel> comments;
  final List<UserVoosModel> voos;
  final UserPostModel user;

  PostModel({
    required this.id,
    required this.descricao,
    required this.imageUrl,
    required this.localizacao,
    required this.stars,
    required this.comments,
    required this.voos,
    required this.user,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'descricao': descricao,
      'imageUrl': imageUrl,
      'localizacao': localizacao,
      'stars': stars,
      'comments': comments.map((x) => x.toMap()).toList(),
      'voos': voos.map((x) => x.toMap()).toList(),
      'user': user.toJson(),
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'] as String,
      descricao: map['descricao'] as String,
      imageUrl: map['imageUrl'] as String,
      localizacao: map['localizacao'] as String,
      stars: map['stars'] as int,
      comments: List<CommentModel>.from(
        (map['comments'] as List<int>).map<CommentModel>(
          (x) => CommentModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      voos: List<UserVoosModel>.from(
        (map['voos'] as List<int>).map<UserVoosModel>(
          (x) => UserVoosModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      user: UserPostModel.fromJson(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
