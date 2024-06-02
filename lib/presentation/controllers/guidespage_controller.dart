import 'package:flutter/material.dart';
import 'package:pov/dto/guide_dto.dart';
import 'package:pov/dto/municipio_dto.dart';
import 'package:pov/repository/guide_repository.dart';
import 'package:pov/repository/municipio_repository.dart';

import '../../services/error/applicationerror.dart';

class GuidesPageController {
  final GuideRepository repository;

  GuidesPageController(this.repository);

  set _error(ApplicationError? error) => solicitacaoErrorApi.value = error;
  ApplicationError? get error => solicitacaoErrorApi.value;
  final solicitacaoErrorApi = ValueNotifier<ApplicationError?>(null);

  set _guias(List<GuideDTO>? guias) => guiasApi.value = guias;
  List<GuideDTO>? get guias => guiasApi.value;
  final guiasApi = ValueNotifier<List<GuideDTO>?>(null);

  set _loading(bool? loading) => loadingApi.value = loading;
  bool? get loading => loadingApi.value;
  final loadingApi = ValueNotifier<bool?>(null);

  String? estado = " ";
  String? municipio = " ";

  Future listarGuias() async {
    _error = null;
    _loading = true;
    try {
      _guias = await repository.getGuides();
    } on ApplicationError catch (e) {
      _error = e;
    }
    _loading = false;
  }

  Future<List<MunicipioDTO?>?> listarMunicipiosPorUF(String uf) async {
    try {
      return await MunicipioRepository().buscarMunicipiosPorUF(uf);
    } catch (e) {
      rethrow;
    }
  }

  Future filtrarGuias() async {
    _error = null;
    _loading = true;

    try {
      _guias = await repository.filterGuides(estado!, municipio!);
    } on ApplicationError catch (e) {
      _error = e;
    }
    _loading = false;
  }
}
