// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pov/dto/trail_dto.dart';
import 'package:pov/models/trails/trail_model.dart';
import 'package:pov/repository/login_repository.dart';
import 'package:pov/repository/trail_repository.dart';
import 'package:pov/services/singleton/auth_singleton.dart';

import '../../services/error/applicationerror.dart';

class TrailPageController {
  TrailRepository repository;

  List? urls = List.empty();

  TrailPageController({
    required this.repository,
  });

  set _error(ApplicationError? error) => solicitacaoErrorApi.value = error;
  ApplicationError? get error => solicitacaoErrorApi.value;
  final solicitacaoErrorApi = ValueNotifier<ApplicationError?>(null);

  Future<List<TrailDTO?>?> listarTrilhas(int guia) async {
    _error = null;
    try {
      return await repository.listarTrilhasPorGuia(guia);
    } on ApplicationError catch (e) {
      _error = e;
    }
    return null;
  }

  Future<TrailModel?> buscarTrilhaPorID(int id) async{
    _error = null;
    try {
      var trilha = await repository.buscarTrilhaPorId(id);

      if(trilha != null){
        urls = trilha.files!.split(";");
        urls!.removeLast();

        return trilha;
      }
    } on ApplicationError catch (e) {
      _error = e;
    }
    return null;
  }

  bool isProfile(int id){
    return AuthSingleton(LoginRepository()).getId() == id;
  }

  Future<bool> excluirTrilha(int id) async{
    try {
      return await repository.excluirTrilha(id);
    } catch (e) {
      rethrow;
    }
  }
}
