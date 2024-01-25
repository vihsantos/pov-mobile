// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pov/dto/trail_dto.dart';
import 'package:pov/repository/trail_repository.dart';

import '../../services/error/applicationerror.dart';

class TrailPageController {
  TrailRepository repository;

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
}
