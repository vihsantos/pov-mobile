import 'package:flutter/material.dart';
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
}
