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

  Future<void> curtirPost() async{
    try {
    //  await repository.
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> excluirPost(int id) async{
    try {
      return await repository.excluirPost(id);
    } catch (e) {
      rethrow;
    }
  }
}
