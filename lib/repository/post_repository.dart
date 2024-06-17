import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:pov/dto/novopost_dto.dart';
import 'package:http/http.dart' as http;
import 'package:pov/models/post/post_model.dart';
import 'package:pov/models/post/postprofile_model.dart';
import 'package:pov/repository/login_repository.dart';
import 'package:pov/services/core/routes.dart';
import 'package:pov/services/singleton/auth_singleton.dart';

import '../dto/post_dto.dart';
import '../services/error/applicationerrorimp.dart';

class PostRepository {

  Future curtirPost(int postid) async {

    String? token = AuthSingleton(LoginRepository()).getToken();

      var response = await http.get(Uri.parse(Routes.addVooInPost+postid.toString()), headers: {
        "content-type": "application/json",
        "accept": "application/json",
        'Authorization': 'Bearer $token',
      });

      if(response.statusCode == 200){
        log("Ok");
      }

  }

  Future<bool> criarNovoPost(MultipartFile pic, NovoPostDTO model) async {
    final uri = Uri.parse(Routes.novoPost);
    String? token = AuthSingleton(LoginRepository()).getToken();

    Map<String, String> fields = {"dados": model.toJson().toString()};

    var request = MultipartRequest("POST", uri);

    request.headers.addAll({
      "content-type": "application/json",
      "accept": "application/json",
      'Authorization': 'Bearer $token',
    });

    request.fields.addAll(fields);

    request.files.add(pic);

    var response = await request.send();
    if (response.statusCode == 200) return true;

    return false;
  }

  Future<PostModel?> buscarPorID(int id) async {
    try {
      String url = "${Routes.post}/$id";

      String? token = AuthSingleton(LoginRepository()).getToken();

      var response = await http.get(Uri.parse(url), headers: {
        "content-type": "application/json",
        "accept": "application/json",
        "token": 'Bearer $token!'
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

  Future<List<PostDTO>> getPosts() async {
    try {
      String url = Routes.posts;

      String? token = AuthSingleton(LoginRepository()).getToken();

      var response = await http.get(Uri.parse(url), headers: {
        "content-type": "application/json",
        "accept": "application/json",
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        Iterable lista = json.decode(response.body);
        List<PostDTO> posts = [];

        for (var element in lista) {
          posts.add(PostDTO.fromMap(element));
        }

        return posts;
      }

      throw ApplicationErrorImp(
          mensagem: response.reasonPhrase.toString(),
          statusCode: response.statusCode);
    } catch (e) {
      throw ApplicationErrorImp(mensagem: e.toString(), statusCode: 500);
    }
  }

  Future<List<PostProfileModel>> getPostsByUser(int id) async {
    try {
      String url = "${Routes.profilePosts}/$id";

      String? token = AuthSingleton(LoginRepository()).getToken();

      var response = await http.get(Uri.parse(url), headers: {
        "content-type": "application/json",
        "accept": "application/json",
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        Iterable lista = json.decode(response.body);

        List<PostProfileModel> posts =
            lista.map((model) => PostProfileModel.fromJson(model)).toList();

        return posts;
      }

      throw ApplicationErrorImp(
          mensagem: response.reasonPhrase.toString(),
          statusCode: response.statusCode);
    } catch (e) {
      throw ApplicationErrorImp(mensagem: e.toString(), statusCode: 500);
    }
  }

  Future<bool> excluirPost(int id) async {
    try {
      String url = "${Routes.deletePost}/$id";

      String? token = AuthSingleton(LoginRepository()).getToken();

      var response = await http.delete(Uri.parse(url), headers: {
        'Authorization': 'Bearer $token',
      });

      if(response.statusCode == 200){
        return true;
      }

      throw ApplicationErrorImp(
          mensagem: response.reasonPhrase.toString(),
          statusCode: response.statusCode);
    } catch (e) {
      throw ApplicationErrorImp(mensagem: e.toString(), statusCode: 500);
    }
  }
}
