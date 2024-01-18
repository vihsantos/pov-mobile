import 'dart:developer';

import '../dto/comment_dto.dart';
import '../services/core/routes.dart';
import 'package:http/http.dart' as http;

import '../services/error/applicationerrorimp.dart';

class CommentRepository {
  Future criarUsuario(CommentDTO comentario) async {
    try {
      String url = Routes.comment;

      var response =
          await http.post(Uri.parse(url), body: comentario.toJson(), headers: {
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
}
