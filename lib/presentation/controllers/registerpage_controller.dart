import 'package:flutter/material.dart';
import 'package:pov/dto/novousuario_dto.dart';

import '../../repository/user_repository.dart';
import '../../services/error/applicationerror.dart';

class RegisterPageController {
  NovoUsuarioDTO usuario = NovoUsuarioDTO();
  final UserRepository repository;

  set _error(ApplicationError? error) => solicitacaoErrorApi.value = error;
  ApplicationError? get error => solicitacaoErrorApi.value;
  final solicitacaoErrorApi = ValueNotifier<ApplicationError?>(null);

  RegisterPageController({required this.repository});

  Future cadastrarUsuario() async {
    try {
      var result = await repository.criarUsuario(usuario);
      return result;
    } on ApplicationError catch (e) {
      _error = e;
    }
  }
}
