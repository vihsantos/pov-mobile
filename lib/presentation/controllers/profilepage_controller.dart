import 'package:flutter/material.dart';
import 'package:pov/models/post/postprofile_model.dart';

import '../../services/error/applicationerror.dart';

class ProfilePageController{

  set _posts(List<PostProfileModel>? posts) => postsApi.value = posts;
  List<PostProfileModel>? get posts => postsApi.value;
  final postsApi = ValueNotifier<List<PostProfileModel>?>(null);

  set _loading(bool? loading) => loadingApi.value = loading;
  bool? get loading => loadingApi.value;
  final loadingApi = ValueNotifier<bool?>(null);

  set _error(ApplicationError? error) => solicitacaoErrorApi.value = error;
  ApplicationError? get error => solicitacaoErrorApi.value;
  final solicitacaoErrorApi = ValueNotifier<ApplicationError?>(null);

  
}