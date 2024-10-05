// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pov/models/post/post_model.dart';
import 'package:pov/repository/login_repository.dart';
import 'package:pov/repository/post_repository.dart';
import 'package:pov/repository/voos_repository.dart';
import 'package:pov/services/singleton/auth_singleton.dart';

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

  Future<void> curtirPost(int id) async{
    try {
      await VoosRepository().addVooInPost(id);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removerCurtidaPost(int id) async{
    try {
      await VoosRepository().removeVooInPost(id);
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

  bool isProfile(int id){
    return AuthSingleton(LoginRepository()).getId() == id;
  }

  int usuarioLogado(){
    return AuthSingleton(LoginRepository()).getId()!;
  }
}
