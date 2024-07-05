import 'package:flutter/material.dart';
import 'package:pov/dto/municipio_dto.dart';
import 'package:pov/models/enums/AreaAtuacao.dart';
import 'package:pov/repository/municipio_repository.dart';
import '../../dto/novousuario_dto.dart';
import '../../repository/user_repository.dart';
import '../../services/error/applicationerror.dart';

class RegisterPageController {
  final UserRepository repository;

  String senha = "";

  set _error(ApplicationError? error) => solicitacaoErrorApi.value = error;
  ApplicationError? get error => solicitacaoErrorApi.value;
  final solicitacaoErrorApi = ValueNotifier<ApplicationError?>(null);

  RegisterPageController({required this.repository});

  NovoUsuarioDTO usuario = NovoUsuarioDTO();
  bool isGuide = false;

  Set<AreaAtuacao> filters = <AreaAtuacao>{};

  Future<bool> cadastrarUsuario() async {
    try {
      if (filters.isNotEmpty) {
        String dados = "";

        for (var area in filters) {
          dados += "${area.id}; ";
        }

        usuario.areatuacao = dados;
      }

      bool? cadastrou = await repository.criarUsuario(usuario);

      if(cadastrou != null) {
        return cadastrou;
      } else {
        return false;
      }

    } on ApplicationError catch (e) {
      _error = e;
      return false;
    }

  }

  Future<List<MunicipioDTO?>?> listarMunicipiosPorUF(String uf) async {
    try {
      return await MunicipioRepository().buscarMunicipiosPorUF(uf);
    } catch (e) {
      rethrow;
    }
  }
}
