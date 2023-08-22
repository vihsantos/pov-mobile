import 'package:flutter/material.dart';
import 'package:pov/models/post/postprofile_model.dart';
import 'package:pov/repository/post_repository.dart';

import '../../services/error/applicationerror.dart';

class ProfilePageController{

  final PostRepository repository;

  ProfilePageController(this.repository);

  set _posts(List<PostProfileModel>? posts) => postsApi.value = posts;
  List<PostProfileModel>? get posts => postsApi.value;
  final postsApi = ValueNotifier<List<PostProfileModel>?>(null);

  set _loading(bool? loading) => loadingApi.value = loading;
  bool? get loading => loadingApi.value;
  final loadingApi = ValueNotifier<bool?>(null);

  set _error(ApplicationError? error) => solicitacaoErrorApi.value = error;
  ApplicationError? get error => solicitacaoErrorApi.value;
  final solicitacaoErrorApi = ValueNotifier<ApplicationError?>(null);

  Future listarPosts(int id) async{
    _error = null;
    try{
      _loading = true;
      _posts = await repository.getPostsByUser(id);
      _loading = false;

    } on ApplicationError catch (e) {
      _error = e;
    }
  }
  
}