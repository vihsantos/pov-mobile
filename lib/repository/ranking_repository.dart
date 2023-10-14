import 'dart:convert';
import 'package:pov/models/ranking/rankingbylocal_model.dart';
import 'package:pov/repository/login_repository.dart';
import 'package:http/http.dart' as http;
import '../services/error/applicationerrorimp.dart';
import '../services/singleton/auth_singleton.dart';

class RankingRepository {
  Future<List<RankingByLocalModel>> getRankingByLocal() async {
    try {
      String url = "http://192.168.2.105:8000/ranking/local";

      String? token = AuthSingleton(LoginRepository()).getToken();

      var response = await http.get(Uri.parse(url), headers: {
        "content-type": "application/json",
        "accept": "application/json",
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        Iterable lista = json.decode(response.body);

        List<RankingByLocalModel> data =
            lista.map((model) => RankingByLocalModel.fromJson(model)).toList();

        return data;
      }

      throw ApplicationErrorImp(
          mensagem: response.reasonPhrase.toString(),
          statusCode: response.statusCode);
    } catch (e) {
      throw ApplicationErrorImp(mensagem: e.toString(), statusCode: 500);
    }
  }
}
