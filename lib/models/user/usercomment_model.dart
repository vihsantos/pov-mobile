// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserCommentModel {
  int? id;
  String? username;

  UserCommentModel({this.id, this.username});

  UserCommentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    return data;
  }
}
