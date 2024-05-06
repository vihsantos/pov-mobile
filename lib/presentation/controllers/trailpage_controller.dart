// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pov/dto/trail_dto.dart';
import 'package:pov/repository/trail_repository.dart';

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

  Future<TrailDTO?> buscarTrilhaPorID(int id) async{
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
}
