import '../services/error/applicationerrorimp.dart';
import '../services/singleton/auth_singleton.dart';
import 'login_repository.dart';
import 'package:http/http.dart' as http;

class FollowersRepository {
  Future follow() async {
    try {
      String url = "http://172.22.17.34:8000/";

      String? token = AuthSingleton(LoginRepository()).getToken();

      var response = await http.get(Uri.parse(url), headers: {
        "content-type": "application/json",
        "accept": "application/json",
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {}

      throw ApplicationErrorImp(
          mensagem: response.reasonPhrase.toString(),
          statusCode: response.statusCode);
    } catch (e) {
      throw ApplicationErrorImp(mensagem: e.toString(), statusCode: 500);
    }
  }

  Future unfollow() async{
    try {
      String url = "http://172.22.17.34:8000/";

      String? token = AuthSingleton(LoginRepository()).getToken();

      var response = await http.get(Uri.parse(url), headers: {
        "content-type": "application/json",
        "accept": "application/json",
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {}

      throw ApplicationErrorImp(
          mensagem: response.reasonPhrase.toString(),
          statusCode: response.statusCode);
    } catch (e) {
      throw ApplicationErrorImp(mensagem: e.toString(), statusCode: 500);
    }
  }
}
