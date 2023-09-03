// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserProfileModel {
  int? id;
  String? username;
  String? profileicon;
  UserProfileModel({this.id, this.profileicon, this.username});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profileicon = json['profileicon'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['profileicon'] = profileicon;
    data['username'] = username;
    return data;
  }
  
}
