import 'package:pov/services/core/routes.dart';

import '../services/error/applicationerrorimp.dart';
import '../services/singleton/auth_singleton.dart';
import 'login_repository.dart';
import 'package:http/http.dart' as http;

class FollowersRepository {
  Future follow(int id) async {
    try {
      String? token = AuthSingleton(LoginRepository()).getToken();

      var response =
          await http.post(Uri.parse("${Routes.following}/$id"), headers: {
        "content-type": "application/json",
        "accept": "application/json",
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        return;
      }

      throw ApplicationErrorImp(
          mensagem: response.reasonPhrase.toString(),
          statusCode: response.statusCode);
    } catch (e) {
      throw ApplicationErrorImp(mensagem: e.toString(), statusCode: 500);
    }
  }

  Future unfollow(int id) async {
    try {
      String? token = AuthSingleton(LoginRepository()).getToken();

      var response =
          await http.post(Uri.parse("${Routes.unfollow}/$id"), headers: {
        "content-type": "application/json",
        "accept": "application/json",
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        return;
      }

      throw ApplicationErrorImp(
          mensagem: response.reasonPhrase.toString(),
          statusCode: response.statusCode);
    } catch (e) {
      throw ApplicationErrorImp(mensagem: e.toString(), statusCode: 500);
    }
  }

  Future<bool> isFollower(int id) async {
    try {
      String? token = AuthSingleton(LoginRepository()).getToken();

      var response =
          await http.get(Uri.parse("${Routes.isFollower}/$id"), headers: {
        "content-type": "application/json",
        "accept": "application/json",
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        return bool.parse(response.body);
      }

      throw ApplicationErrorImp(
          mensagem: response.reasonPhrase.toString(),
          statusCode: response.statusCode);
    } catch (e) {
      throw ApplicationErrorImp(mensagem: e.toString(), statusCode: 500);
    }
  }
}
