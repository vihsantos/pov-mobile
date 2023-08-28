// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names
import 'dart:convert';

import 'package:pov/models/post/comment_model.dart';
import 'package:pov/models/user/userpost_model.dart';
import 'package:pov/models/user/uservoos_model.dart';

class PostModel {
  int? id;
  DateTime? dataCriacao;
  String? description;
  String? image_url;
  String? localizacao;
  int? stars;
  List<UserVoosModel>? voos;
  List<CommentModel>? comment;
  UserPostModel? user;
  PostModel({
    this.id,
    this.dataCriacao,
    this.description,
    this.image_url,
    this.localizacao,
    this.stars,
    this.voos,
    this.comment,
    this.user,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'dataCriacao': dataCriacao?.millisecondsSinceEpoch,
      'description': description,
      'image_url': image_url,
      'localizacao': localizacao,
      'stars': stars,
      'voos': voos!.map((x) => x.toMap()).toList(),
      'comment': comment!.map((x) => x.toMap()).toList(),
      'user': user?.toJson(),
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'] != null ? map['id'] as int : null,
      dataCriacao: map['dataCriacao'] != null ? DateTime.parse(map['dataCriacao'] as String) : null,
      description: map['description'] != null ? map['description'] as String : null,
      image_url: map['image_url'] != null ? map['image_url'] as String : null,
      localizacao: map['localizacao'] != null ? map['localizacao'] as String : null,
      stars: map['stars'] != null ? map['stars'] as int : null,
      voos: map['voos'] != null ? List<UserVoosModel>.from((map['voos'] as List<dynamic>).map<UserVoosModel?>((x) => UserVoosModel.fromMap(x as Map<String,dynamic>),),) : null,
      comment: map['comment'] != null ? List<CommentModel>.from((map['comment'] as List<dynamic>).map<CommentModel?>((x) => CommentModel.fromMap(x as Map<String,dynamic>),),) : null,
      user: map['user'] != null ? UserPostModel.fromJson(map['user'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) => PostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
