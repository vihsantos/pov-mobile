// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import '../../models/login/login_model.dart';
import '../../repository/login_repository.dart';

class LoginPageController {
  final LoginRepository loginRepository;
  LoginPageController({
    required this.loginRepository,
  });

  LoginModel model = LoginModel();

  Future logar() async {
    try {
      var user = await loginRepository.logar(model);
      log(user.toString());
    } catch (e) {
      throw Exception();
    }
  }
}
