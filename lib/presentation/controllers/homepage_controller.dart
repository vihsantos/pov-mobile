import 'package:flutter/material.dart';
import 'package:pov/dto/trail_dto.dart';
import 'package:pov/repository/trail_repository.dart';
import '../../dto/post_dto.dart';
import '../../repository/post_repository.dart';
import '../../services/error/applicationerror.dart';

class HomePageController {
  final PostRepository postRepository;
  final TrailRepository trailRepository;

  HomePageController(this.postRepository, this.trailRepository);

  set _error(ApplicationError? error) => solicitacaoErrorApi.value = error;
  ApplicationError? get error => solicitacaoErrorApi.value;
  final solicitacaoErrorApi = ValueNotifier<ApplicationError?>(null);

  set _loading(bool? loading) => loadingApi.value = loading;
  bool? get loading => loadingApi.value;
  final loadingApi = ValueNotifier<bool?>(null);

  set _posts(List<PostDTO>? posts) => postApi.value = posts;
  List<PostDTO>? get posts => postApi.value;
  final postApi = ValueNotifier<List<PostDTO>?>(null);

  int get qtdPosts => posts != null ? posts!.length : 0;

  int skip = 0;
  int take = 10;
 

  Future<List<PostDTO?>?> listarPosts() async {
    _error = null;
    try {
      List<PostDTO?> posts = await postRepository.getPosts();
      return posts;
    } on ApplicationError catch (e) {
      _error = e;
    }
    return null;
  }

  Future<List<TrailDTO?>?> listarTrilhas() async {
    _error = null;
    try {
      List<TrailDTO?> trilhas = await trailRepository.getTrilhas();
      return trilhas;
    } on ApplicationError catch (e) {
      _error = e;
    }
    return null;
  }
  
  Future listarTodosPosts() async {
    _error = null;
    _loading = true;
    try {
      _posts = await postRepository.getAllPosts(take, skip);
    } on ApplicationError catch (e) {
      _error = e;
    }
    _loading = false;
  }

  Future listarMaisPosts () async{
    _error = null;
    _loading = true;
    try {
      take += 10;
      skip += 10;

      posts!.addAll(await postRepository.getAllPosts(take, skip));
      
    } on ApplicationError catch (e) {
      _error = e;
    }
    _loading = false;
  }
}
