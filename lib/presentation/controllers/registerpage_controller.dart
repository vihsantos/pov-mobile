import 'package:flutter/material.dart';
import 'package:pov/dto/municipio_dto.dart';
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

  Future cadastrarUsuario() async {
    try {
       await repository.criarUsuario(usuario);
    } on ApplicationError catch (e) {
      _error = e;
    }
  }

  Future<List<MunicipioDTO?>?> listarMunicipiosPorUF(String uf) async{
    try {
      return await MunicipioRepository().buscarMunicipiosPorUF(uf);
    } catch (e) {
      rethrow;
    }

  }
}
