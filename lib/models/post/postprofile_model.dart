// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PostProfileMode {
  final int id;
  final String image_url;
  final int stars;
  PostProfileMode({
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

  factory PostProfileMode.fromMap(Map<String, dynamic> map) {
    return PostProfileMode(
      id: map['id'] as int,
      image_url: map['image_url'] as String,
      stars: map['stars'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostProfileMode.fromJson(String source) => PostProfileMode.fromMap(json.decode(source) as Map<String, dynamic>);
}
