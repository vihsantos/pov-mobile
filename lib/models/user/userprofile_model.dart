// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserProfileModel {
  int? id;
  String? username;
  String? profile;
  UserProfileModel({this.id, this.profile, this.username});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profile = json['profile'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['profile'] = profile;
    data['username'] = username;
    return data;
  }
}
