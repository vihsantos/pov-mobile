import 'package:pov/models/login/acess_model.dart';
import 'package:pov/models/login/login_model.dart';

import '../../repository/login_repository.dart';

class AuthSingleton {
  late LoginRepository _repository;
  AcessModel? _acess;

  static final AuthSingleton _auth = AuthSingleton._internal();

  AuthSingleton._internal();

  factory AuthSingleton(LoginRepository lRepository) {
    _auth._repository = lRepository;
    return _auth;
  }

  String? getToken() {
    return _acess == null ? null : _acess!.token;
  }

  Future<AcessModel?> authenticate(LoginModel login) async {
    try {
      return _acess = await _repository.logar(login);
    } catch (e) {
      return null;
    }
  }
}
