// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PostProfileModel {
  final int id;
  final String image_url;
  final int stars;
  PostProfileModel({
    required this.id,
    required this.image_url,
    required this.stars,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image_url': image_url,
      'stars': stars,
    };
  }

  factory PostProfileModel.fromMap(Map<String, dynamic> map) {
    return PostProfileModel(
      id: map['id'] as int,
      image_url: map['image_url'] as String,
      stars: map['stars'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostProfileModel.fromJson(String source) => PostProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
