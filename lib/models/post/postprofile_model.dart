// ignore_for_file: non_constant_identifier_names

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PostProfileModel {
  int? id;
  String? image_url;
  int? stars;
  PostProfileModel({
    this.id,
    this.image_url,
    this.stars,
  });

  PostProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image_url = json['image_url'];
    stars = json['stars'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image_url'] = image_url;
    data['stars'] = stars;
    return data;
  }
}
