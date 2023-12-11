import 'dart:developer';

import 'package:pov/dto/novousuario_dto.dart';
import 'package:http/http.dart' as http;
import 'package:pov/services/core/routes.dart';
import '../dto/dadosperfil_dto.dart';
import '../services/error/applicationerrorimp.dart';
import '../services/singleton/auth_singleton.dart';
import 'login_repository.dart';

class UserRepository {
  Future criarUsuario(NovoUsuarioDTO usuario) async {
    try {
      String url = Routes.novoUsuario;

      var response =
          await http.post(Uri.parse(url), body: usuario.toJson(), headers: {
        "content-type": "application/json",
        "accept": "application/json",
      });

      if (response.statusCode == 201) log("FOI!!");

      throw ApplicationErrorImp(
          mensagem: response.reasonPhrase.toString(),
          statusCode: response.statusCode);
    } catch (e) {
      throw ApplicationErrorImp(mensagem: e.toString(), statusCode: 500);
    }
  }

  Future<DadosPerfilDTO> buscarDadosPerfil(int id) async {
    try {
      String url = "${Routes.usuario}$id";

      String? token = AuthSingleton(LoginRepository()).getToken();

      var response = await http.get(Uri.parse(url), headers: {
        "content-type": "application/json",
        "accept": "application/json",
        "Authorization": "Bearer $token",
      });

      if (response.statusCode == 200) {
        log(response.body);
        return DadosPerfilDTO.fromJson(response.body);
      }

      throw ApplicationErrorImp(
          mensagem: response.reasonPhrase.toString(),
          statusCode: response.statusCode);
    } catch (e) {
      throw ApplicationErrorImp(mensagem: e.toString(), statusCode: 500);
    }
  }
}
