// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pov/dto/dadosperfil_dto.dart';
import 'package:pov/dto/infoguide_dto.dart';
import 'package:pov/models/post/postprofile_model.dart';
import 'package:pov/repository/followers_repository.dart';
import 'package:pov/repository/login_repository.dart';
import 'package:pov/repository/post_repository.dart';
import 'package:pov/repository/user_repository.dart';
import 'package:pov/services/error/applicationerrorimp.dart';
import 'package:pov/services/singleton/auth_singleton.dart';

import '../../services/error/applicationerror.dart';

class ProfilePageController {
  final PostRepository postRepository;
  final UserRepository userRepository;
  final FollowersRepository followersRepository;

  ProfilePageController({
    required this.postRepository,
    required this.userRepository,
    required this.followersRepository,
  });

  set _loading(bool? loading) => loadingApi.value = loading;
  bool? get loading => loadingApi.value;
  final loadingApi = ValueNotifier<bool?>(null);

  set _posts(List<PostProfileModel>? posts) => postsApi.value = posts;
  List<PostProfileModel>? get posts => postsApi.value;
  final postsApi = ValueNotifier<List<PostProfileModel>?>(null);

  set _error(ApplicationError? error) => solicitacaoErrorApi.value = error;
  ApplicationError? get error => solicitacaoErrorApi.value;
  final solicitacaoErrorApi = ValueNotifier<ApplicationError?>(null);

  // ignore: unused_element
  set _profileIcon(File? profileIcon) => profileIconApi.value = profileIcon;
  File? get profileIcon => profileIconApi.value;
  final profileIconApi = ValueNotifier<File?>(null);


  set _isFollower(bool? isFollower) => isFollowerApi.value = isFollower;
  bool? get isFollower => isFollowerApi.value;
  final isFollowerApi = ValueNotifier<bool?>(null);

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

  bool isProfile(int id){
    return AuthSingleton(LoginRepository()).getId() == id;
  }

  Future verificarSeguidor(int id) async {
    _loading = true;
    try{
      bool perfil = isProfile(id);

    if(!perfil){
      bool dado = await followersRepository.isFollower(id);
      _isFollower = dado;
    } 
    } on ApplicationError catch (e) {
      _error = e;
    }
    _loading = false;
  }

  Future seguirOuDeixarDeSeguir(int id)async {
    _loading = true;
    if(isFollower!){
      await followersRepository.unfollow(id);
      verificarSeguidor(id);

    } else {
      await followersRepository.follow(id);
      verificarSeguidor(id);
    }
    _loading = false;

  }

  alterarProfileIcon(File file){
    _profileIcon = file;
  }

  Future enviarImagem() async {
    _error = null;
    try {

      if(profileIcon == null) throw ApplicationErrorImp(mensagem: "Imagem não escolhida");

      var pic = await MultipartFile.fromPath("arquivo", profileIcon!.path);
      return await userRepository.alterarFotoPerfil(pic);
    } on ApplicationError catch (e) {
      _error = e;
    }
  }

  Future<InfoGuideDTO?> buscarInformacoesGuia(int id) async {
    _error = null;
    try{
      var informacoes = userRepository.buscarInformacoesGuia(id);

      return informacoes;
    } on ApplicationError catch (e) {
      _error = e;
    }
  }

}