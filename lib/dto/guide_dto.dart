// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pov/models/guide/guide_model.dart';
import 'package:pov/models/user/userprofile_model.dart';

class GuideDTO {
  GuideModel? guide;
  UserProfileModel? user;
  GuideDTO({
    this.guide,
    this.user,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'guide': guide?.toMap(),
      'user': user?.toMap(),
    };
  }

  factory GuideDTO.fromMap(Map<String, dynamic> map) {
    return GuideDTO(
      guide: map['guide'] != null ? GuideModel.fromMap(map['guide'] as Map<String,dynamic>) : null,
      user: map['user'] != null ? UserProfileModel.fromMap(map['user'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GuideDTO.fromJson(String source) => GuideDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
