// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names
import 'dart:convert';
import 'package:pov/models/localization_model.dart';
import 'package:pov/models/user/userpost_model.dart';
import 'package:pov/models/user/uservoos_model.dart';

class PostModel {
  int? id;
  DateTime? dataCriacao;
  String? description;
  String? image_url;
  LocalizationModel? localization;
  int? stars;
  List<UserVoosModel>? voos;
  UserPostModel? user;

  PostModel({
    this.id,
    this.dataCriacao,
    this.description,
    this.image_url,
    this.localization,
    this.stars,
    this.voos,
    this.user,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'dataCriacao': dataCriacao?.millisecondsSinceEpoch,
      'description': description,
      'image_url': image_url,
      'localization': localization?.toJson(),
      'stars': stars,
      'voos': voos!.map((x) => x.toMap()).toList(),
      'user': user!.toJson(),
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'] != null ? map['id'] as int : null,
      dataCriacao: map['dataCriacao'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dataCriacao'] as int)
          : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      image_url: map['image_url'] != null ? map['image_url'] as String : null,
      localization: map['localization'] != null
          ? LocalizationModel.fromJson(
              map['localization'] as Map<String, dynamic>)
          : null,
      stars: map['stars'] != null ? map['stars'] as int : null,
      voos: map['voos'] != null
          ? List<UserVoosModel>.from(
              (map['voos'] as List<dynamic>).map<UserVoosModel?>(
                (x) => UserVoosModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      user: map['user'] != null
          ? UserPostModel.fromJson(map['user'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
