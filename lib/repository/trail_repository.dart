import 'dart:convert';
import 'package:http/http.dart';
import 'package:pov/dto/trail_dto.dart';
import 'package:pov/services/error/applicationerrorimp.dart';
import 'package:http/http.dart' as http;
import '../services/core/routes.dart';
import '../services/singleton/auth_singleton.dart';
import 'login_repository.dart';

class TrailRepository {
  Future<bool> criarNovaTrilha(List<MultipartFile> pics, TrailDTO model) async {
    final uri = Uri.parse(Routes.trail);
    String? token = AuthSingleton(LoginRepository()).getToken();

    Map<String, String> fields = {"dados": model.toJson().toString()};

    var request = MultipartRequest("POST", uri);

    request.headers.addAll({
      "content-type": "application/json",
      "accept": "application/json",
      'Authorization': 'Bearer $token',
    });

    request.fields.addAll(fields);

    request.files.addAll(pics);

    var response = await request.send();
    if (response.statusCode == 200) return true;

    return false;
  }

  Future<List<TrailDTO>> listarTrilhasPorGuia(int guia) async {
    try {
      String url = "${Routes.trails}/$guia";

      String? token = AuthSingleton(LoginRepository()).getToken();

      var response = await http.get(Uri.parse(url), headers: {
        "content-type": "application/json",
        "accept": "application/json",
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        Iterable lista = json.decode(response.body);
        List<TrailDTO> trilhas = [];

        for (var element in lista) {
          trilhas.add(TrailDTO.fromMap(element));
        }

        return trilhas;
      }

      throw ApplicationErrorImp(
          mensagem: response.reasonPhrase.toString(),
          statusCode: response.statusCode);
    } catch (e) {
      throw ApplicationErrorImp(mensagem: e.toString(), statusCode: 500);
    }
  }

    Future<List<TrailDTO>> getTrilhas() async {
    try {
      String url = Routes.trails;

      String? token = AuthSingleton(LoginRepository()).getToken();

      var response = await http.get(Uri.parse(url), headers: {
        "content-type": "application/json",
        "accept": "application/json",
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        Iterable lista = json.decode(response.body);
        List<TrailDTO> trilhas = [];

        for (var element in lista) {
          trilhas.add(TrailDTO.fromMap(element));
        }

        return trilhas;
      }

      throw ApplicationErrorImp(
          mensagem: response.reasonPhrase.toString(),
          statusCode: response.statusCode);
    } catch (e) {
      throw ApplicationErrorImp(mensagem: e.toString(), statusCode: 500);
    }
  }

  Future<TrailDTO?> buscarTrilhaPorId(int id) async{
    try {
      
      String url = "${Routes.findTrail}/$id";

      String? token = AuthSingleton(LoginRepository()).getToken();

      var response = await http.get(Uri.parse(url), headers: {
        "content-type": "application/json",
        "accept": "application/json",
        'Authorization': 'Bearer $token',
      });

      if(response.statusCode == 200){
        return TrailDTO.fromJson(response.body);
      }

      throw ApplicationErrorImp(
          mensagem: response.reasonPhrase.toString(),
          statusCode: response.statusCode);

    } catch (e) {
      throw ApplicationErrorImp(mensagem: e.toString(), statusCode: 500);
    }
  }
}
