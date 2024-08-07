// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pov/repository/login_repository.dart';
import 'package:pov/services/singleton/auth_singleton.dart';
import '../../models/login/login_model.dart';
import '../../services/error/applicationerror.dart';

class LoginPageController {
  final AuthSingleton authSingleton;
  LoginPageController({
    required this.authSingleton,
  });

  set _error(ApplicationError? error) => solicitacaoErrorApi.value = error;
  ApplicationError? get error => solicitacaoErrorApi.value;
  final solicitacaoErrorApi = ValueNotifier<ApplicationError?>(null);

  LoginModel model = LoginModel();
  String email = "";
  String username = "";
  String senha = "";
  int userId = 0;

  Future logar() async {
    _error = null;
    try {
      var user = await authSingleton.authenticate(model);
      await authSingleton.verifyLocalization();
      return user;
    } on ApplicationError catch (e) {
      _error = e;
    }
  }

  Future trocarSenhaParteUm() async{
    try{
      userId = (await LoginRepository().buscarIdUsuario(username, email))!;

    } on ApplicationError catch (e) {
      _error = e;
    }
  }

  Future trocarSenhaParteDois() async{
    try{
      return await LoginRepository().alterarSenha(userId, senha);
    } on ApplicationError catch (e) {
      _error = e;
    }
  }

}
