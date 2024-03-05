import '../services/core/routes.dart';
import '../services/error/applicationerrorimp.dart';
import '../services/singleton/auth_singleton.dart';
import 'login_repository.dart';
import 'package:http/http.dart' as http;


class VoosRepository{
  Future addVooInPost(int post_id) async {
    try {
      String? token = AuthSingleton(LoginRepository()).getToken();

      var response = await http.get(Uri.parse("${Routes.following}/$post_id"), headers: {
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