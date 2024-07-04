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
  
  Future<List<PostDTO?>?> listarTodosPosts(int take, int skip) async {
    _error = null;
    try {
      List<PostDTO?> posts = await postRepository.getAllPosts(take, skip);
      return posts;
    } on ApplicationError catch (e) {
      _error = e;
    }
    return null;
  }
}
