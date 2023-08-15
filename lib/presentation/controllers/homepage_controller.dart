import 'package:flutter/material.dart';
import '../../dto/post_dto.dart';
import '../../repository/post_repository.dart';
import '../../services/error/applicationerror.dart';

class HomePageController {
  final PostRepository postRepository;

  HomePageController(this.postRepository);

  set _error(ApplicationError? error) => solicitacaoErrorApi.value = error;
  ApplicationError? get error => solicitacaoErrorApi.value;
  final solicitacaoErrorApi = ValueNotifier<ApplicationError?>(null);

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
}
