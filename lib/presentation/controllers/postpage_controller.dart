// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pov/models/post/post_model.dart';
import 'package:pov/repository/post_repository.dart';

class PostPageController {
  PostRepository repository;

  PostPageController({
    required this.repository,
  });

  Future<PostModel?> buscarPostPorID(int id) async {
    try{
      return await repository.buscarPorID(id);
    } catch (e){
      return null;
    }
  }
}
