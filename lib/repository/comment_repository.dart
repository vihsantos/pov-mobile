import 'dart:convert';
import 'dart:developer';

import '../dto/comment_dto.dart';
import '../models/post/comment_model.dart';
import '../services/core/routes.dart';
import 'package:http/http.dart' as http;

import '../services/error/applicationerrorimp.dart';
import '../services/singleton/auth_singleton.dart';
import 'login_repository.dart';

class CommentRepository {
  Future criarComentario(CommentDTO comentario) async {
    try {
      String url = Routes.comment;
      String? token = AuthSingleton(LoginRepository()).getToken();

      var response =
          await http.post(Uri.parse(url), body: comentario.toJson(), headers: {
        "content-type": "application/json",
        "accept": "application/json",
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 201) log("FOI!!");

      throw ApplicationErrorImp(
          mensagem: response.reasonPhrase.toString(),
          statusCode: response.statusCode);
    } catch (e) {
      throw ApplicationErrorImp(mensagem: e.toString(), statusCode: 500);
    }
  }

  // ignore: non_constant_identifier_names
  Future<List<CommentModel>> listarComentariosPorPost(int post_id) async {
    try {
      String url = "${Routes.commentsByPosts}/$post_id";
      String? token = AuthSingleton(LoginRepository()).getToken();

      var response = await http.get(Uri.parse(url), headers: {
        "content-type": "application/json",
        "accept": "application/json",
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        Iterable lista = json.decode(response.body);
        List<CommentModel> comments =
            lista.map((model) => CommentModel.fromJson(model)).toList();

        return comments;
      }

      throw ApplicationErrorImp(
          mensagem: response.reasonPhrase.toString(),
          statusCode: response.statusCode);
    } catch (e) {
      throw ApplicationErrorImp(mensagem: e.toString(), statusCode: 500);
    }
  }
}
