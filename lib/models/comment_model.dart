// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pov/models/user/usercomment_model.dart';

class CommentModel {
  String? description;
  int? id;
  UserCommentModel? user;

  CommentModel({this.description, this.id, this.user});

  CommentModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    user =
        json['user'] != null ? UserCommentModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['id'] = id;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
