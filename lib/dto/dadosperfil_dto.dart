// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pov/models/user/userfollow_model.dart';

class DadosPerfilDTO {
  String? username;
  bool? guide;
  List<UserFollowModel>? followers;
  List<UserFollowModel>? following;

  DadosPerfilDTO({
    this.username,
    this.guide,
    this.followers,
    this.following,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'guide': guide,
      'followers': followers!.map((x) => x.toMap()).toList(),
      'following': following!.map((x) => x.toMap()).toList(),
    };
  }

  factory DadosPerfilDTO.fromMap(Map<String, dynamic> map) {
    return DadosPerfilDTO(
      username: map['username'] != null ? map['username'] as String : null,
      guide: map['guide'] != null ? map['guide'] as bool : null,
      followers: map['followers'] != null
          ? List<UserFollowModel>.from(
              (map['followers'] as List<dynamic>).map<UserFollowModel?>(
                (x) => UserFollowModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      following: map['following'] != null
          ? List<UserFollowModel>.from(
              (map['following'] as List<dynamic>).map<UserFollowModel?>(
                (x) => UserFollowModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DadosPerfilDTO.fromJson(String source) =>
      DadosPerfilDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
