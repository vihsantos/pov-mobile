import 'package:flutter/material.dart';
import 'package:pov/dto/guide_dto.dart';
import 'package:pov/repository/guide_repository.dart';

import '../../services/error/applicationerror.dart';

class GuidesPageController{
  final GuideRepository repository;

  GuidesPageController(this.repository);

  set _error(ApplicationError? error) => solicitacaoErrorApi.value = error;
  ApplicationError? get error => solicitacaoErrorApi.value;
  final solicitacaoErrorApi = ValueNotifier<ApplicationError?>(null);


  Future<List<GuideDTO?>?> listarGuias() async {
    _error = null;
    try {
      List<GuideDTO?> guias = await repository.getGuides();
      return guias;
    } on ApplicationError catch (e) {
      _error = e;
    }
    return null;
  }
}