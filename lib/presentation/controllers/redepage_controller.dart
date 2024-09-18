import 'package:flutter/material.dart';
import 'package:pov/dto/post_dto.dart';
import 'package:pov/services/error/applicationerror.dart';

import '../../repository/post_repository.dart';

class RedePageController{
  final PostRepository repository;

  RedePageController({required this.repository});

  int skip = 0;
  int take = 10;

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

  Future listarTodosPosts() async {
    _error = null;
    _loading = true;
    try {
      _posts = await repository.getAllPostsFollowing(take, skip);
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

      posts!.addAll(await repository.getAllPostsFollowing(take, skip));
      
    } on ApplicationError catch (e) {
      _error = e;
    }
    _loading = false;
  }
}