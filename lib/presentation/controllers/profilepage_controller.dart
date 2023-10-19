// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pov/dto/dadosperfil_dto.dart';
import 'package:pov/models/post/postprofile_model.dart';
import 'package:pov/repository/post_repository.dart';
import 'package:pov/repository/user_repository.dart';

import '../../services/error/applicationerror.dart';

class ProfilePageController {
  final PostRepository postRepository;
  final UserRepository userRepository;

  ProfilePageController({
    required this.postRepository,
    required this.userRepository,
  });

  set _posts(List<PostProfileModel>? posts) => postsApi.value = posts;
  List<PostProfileModel>? get posts => postsApi.value;
  final postsApi = ValueNotifier<List<PostProfileModel>?>(null);

  set _error(ApplicationError? error) => solicitacaoErrorApi.value = error;
  ApplicationError? get error => solicitacaoErrorApi.value;
  final solicitacaoErrorApi = ValueNotifier<ApplicationError?>(null);

  Future<List<PostProfileModel>?> listarPosts(int id) async {
    _error = null;
    try {
      return _posts = await postRepository.getPostsByUser(id);
    } on ApplicationError catch (e) {
      _error = e;
    }
    return null;
  }

  Future<DadosPerfilDTO?> dadosPerfil(int id) async {
    _error = null;
    try {
      return await userRepository.buscarDadosPerfil(id);
    } on ApplicationError catch (e) {
      _error = e;
    }
    return null;
  }
}
