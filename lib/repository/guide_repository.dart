import 'dart:convert';

import 'package:pov/dto/guide_dto.dart';
import 'package:http/http.dart' as http;
import 'package:pov/services/core/routes.dart';

import '../services/error/applicationerrorimp.dart';
import '../services/singleton/auth_singleton.dart';
import 'login_repository.dart';

class GuideRepository {
  Future<List<GuideDTO>> getGuides() async {
    try {
      String url = Routes.guides;

      String? token = AuthSingleton(LoginRepository()).getToken();

      var response = await http.get(Uri.parse(url), headers: {
        "content-type": "application/json",
        "accept": "application/json",
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        Iterable lista = json.decode(response.body);
        List<GuideDTO> guias =
            lista.map((model) => GuideDTO.fromJson(model)).toList();

        return guias;
      }

      throw ApplicationErrorImp(
          mensagem: response.reasonPhrase.toString(),
          statusCode: response.statusCode);
    } catch (e) {
      throw ApplicationErrorImp(mensagem: e.toString(), statusCode: 500);
    }
  }

  Future<List<GuideDTO>> filterGuides(String estado, String municipio) async {
    try {
      String url = "${Routes.searchGuides}$estado/$municipio";

      String? token = AuthSingleton(LoginRepository()).getToken();

      var response = await http.get(Uri.parse(url), headers: {
        "content-type": "application/json",
        "accept": "application/json",
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        Iterable lista = json.decode(response.body);
        List<GuideDTO> guias =
            lista.map((model) => GuideDTO.fromJson(model)).toList();

        return guias;
      }

      throw ApplicationErrorImp(
          mensagem: response.reasonPhrase.toString(),
          statusCode: response.statusCode);
    } catch (e) {
      throw ApplicationErrorImp(mensagem: e.toString(), statusCode: 500);
    }
  }

  Future<bool> informarContato(String contato) async{
    try{

      String url = "${Routes.informarContato}"+contato;

      String? token = AuthSingleton(LoginRepository()).getToken();

      var response = await http.post(Uri.parse(url), headers: {
        "content-type": "application/json",
        "accept": "application/json",
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        return true;
      }

      return false;
    }catch (e) {
      throw ApplicationErrorImp(mensagem: e.toString(), statusCode: 500);
    }
  }
}
