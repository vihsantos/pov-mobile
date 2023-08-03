import 'dart:developer';

import 'package:http/http.dart';
import 'package:pov/dto/novopost_dto.dart';
import 'package:http/http.dart' as http;
import 'package:pov/models/post/post_model.dart';
import 'package:pov/repository/login_repository.dart';
import 'package:pov/services/singleton/auth_singleton.dart';

import '../services/error/applicationerrorimp.dart';

class PostRepository {
  Future<PostModel?> criarPost(NovoPostDTO post) async {
    try {
      String url = "http://192.168.2.104:8000/newpost";
      String? token = AuthSingleton(LoginRepository()).getToken();

      var response =
          await http.post(Uri.parse(url), body: post.toJson(), headers: {
        "content-type": "application/json",
        "accept": "application/json",
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        return PostModel.fromJson(response.body);
      }

      throw ApplicationErrorImp(
          mensagem: response.reasonPhrase.toString(),
          statusCode: response.statusCode);
    } catch (e) {
      throw ApplicationErrorImp(mensagem: e.toString(), statusCode: 500);
    }
  }

  Future enviarPostFile(MultipartFile pic) async {
    final uri = Uri.parse("http://192.168.2.104:8000/teste");
    String? token = AuthSingleton(LoginRepository()).getToken();

    var request = MultipartRequest("POST", uri);

    request.headers.addAll({
      "content-type": "application/json",
      "accept": "application/json",
      'Authorization': 'Bearer $token',
    });

  

    request.files.add(pic);

    var response = await request.send();
    if (response.statusCode == 200) log("Ok!!");
  }

  Future<PostModel?> buscarPorID(int id) async {
    try {
      String url = "http://192.168.2.104:8000/newpost";

      String? token = AuthSingleton(LoginRepository()).getToken();

      var response = await http.get(Uri.parse(url), headers: {
        "content-type": "application/json",
        "accept": "application/json",
        "token": token!
      });

      if (response.statusCode == 200) {
        return PostModel.fromJson(response.body);
      }

      throw ApplicationErrorImp(
          mensagem: response.reasonPhrase.toString(),
          statusCode: response.statusCode);
    } catch (e) {
      throw ApplicationErrorImp(mensagem: e.toString(), statusCode: 500);
    }
  }
}
