// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import '../models/localization_model.dart';
import '../models/user/userpost_model.dart';

class PostDTO {
  String? description;
  int? id;
  String? image_url;
  LocalizationModel? localization;
  int? stars;
  UserPostModel? user;

  PostDTO({
    this.description,
    this.id,
    this.image_url,
    this.localization,
    this.stars,
    this.user,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'id': id,
      'image_url': image_url,
      'localization': localization?.toJson(),
      'stars': stars,
      'user': user?.toJson(),
    };
  }

  factory PostDTO.fromMap(Map<String, dynamic> map) {
    return PostDTO(
      description: map['description'] != null ? map['description'] as String : null,
      id: map['id'] != null ? map['id'] as int : null,
      image_url: map['image_url'] != null ? map['image_url'] as String : null,
      localization: map['localization'] != null ? LocalizationModel.fromJson(map['localization'] as Map<String,dynamic>) : null,
      stars: map['stars'] != null ? map['stars'] as int : null,
      user: map['user'] != null ? UserPostModel.fromMap(map['user'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostDTO.fromJson(String source) => PostDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
