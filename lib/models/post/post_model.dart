import 'package:pov/models/post/comment_model.dart';
import 'package:pov/models/user/userpost_model.dart';
import 'package:pov/models/user/uservoos_model.dart';

class PostModel {
  final String id;
  final String descricao;
  final String imageUrl;
  final int stars;
  final List<CommentModel> comments;
  final List<UserVoosModel> voos;
  final UserPostModel user;

  PostModel(this.id, this.descricao, this.imageUrl, this.stars, this.comments,
      this.voos, this.user);
}
