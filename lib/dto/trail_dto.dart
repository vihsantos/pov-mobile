// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pov/models/user/userpost_model.dart';

class TrailDTO {
  String? description;
  String? files;
  int? id;
  String? name;
  String? occupation;
  UserPostModel? user;

  TrailDTO(
      {this.description,
      this.files,
      this.id,
      this.name,
      this.occupation,
      this.user});

  TrailDTO.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    files = json['files'];
    id = json['id'];
    name = json['name'];
    occupation = json['occupation'];
    user = json['user'] != null ? UserPostModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['files'] = files;
    data['id'] = id;
    data['name'] = name;
    data['occupation'] = occupation;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

