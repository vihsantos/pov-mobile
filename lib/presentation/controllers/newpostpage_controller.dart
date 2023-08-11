import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pov/repository/post_repository.dart';

import '../../dto/novopost_dto.dart';
import '../../services/error/applicationerror.dart';

class NewPostPageController {
  final PostRepository repository;
  NovoPostDTO novoPost = NovoPostDTO();

  set _error(ApplicationError? error) => solicitacaoErrorApi.value = error;
  ApplicationError? get error => solicitacaoErrorApi.value;
  final solicitacaoErrorApi = ValueNotifier<ApplicationError?>(null);

  NewPostPageController({required this.repository});

  Future criarPost() async {
    _error = null;
    try {
      novoPost.user_id = 0;
      repository.criarPost(novoPost);
    } on ApplicationError catch (e) {
      _error = e;
    }
  }

  Future enviarImagem(File file) async {
    _error = null;
    try {
      var pic = await MultipartFile.fromPath("arquivo", file.path);
      return await repository.criarNovoPost(pic, novoPost);
    } on ApplicationError catch (e) {
      _error = e;
    }
  }
}
