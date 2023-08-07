// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../models/user/userpost_model.dart';

class PostDTO {
  String? description;
  int? id;
  String? imageUrl;
  String? localizacao;
  int? stars;
  UserPostModel? user;

  PostDTO(
      {this.description,
      this.id,
      this.imageUrl,
      this.localizacao,
      this.stars,
      this.user});

  PostDTO.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    imageUrl = json['image_url'];
    localizacao = json['localizacao'];
    stars = json['stars'];
    user = json['user'] != null ? UserPostModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['id'] = id;
    data['image_url'] = imageUrl;
    data['localizacao'] = localizacao;
    data['stars'] = stars;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
