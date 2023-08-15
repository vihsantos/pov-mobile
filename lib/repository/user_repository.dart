import 'dart:developer';

import 'package:pov/dto/novousuario_dto.dart';
import 'package:http/http.dart' as http;
import '../services/error/applicationerrorimp.dart';

class UserRepository {

  Future criarUsuario(NovoUsuarioDTO usuario) async {
    try {
      String url = "http://192.168.2.101:8000/criarusuario";

      var response =
          await http.post(Uri.parse(url), body: usuario.toJson(), headers: {
          "content-type": "application/json",
          "accept": "application/json",
      });

      if(response.statusCode == 201) log("FOI!!");

      throw ApplicationErrorImp(
          mensagem: response.reasonPhrase.toString(),
          statusCode: response.statusCode);
    } catch (e) {
      throw ApplicationErrorImp(mensagem: e.toString(), statusCode: 500);
    }
  }
}
