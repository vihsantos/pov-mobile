import '../services/core/routes.dart';
import '../services/error/applicationerrorimp.dart';
import '../services/singleton/auth_singleton.dart';
import 'login_repository.dart';
import 'package:http/http.dart' as http;


class VoosRepository{
  Future addVooInPost(int postId) async {
    try {
      String? token = AuthSingleton(LoginRepository()).getToken();

      var response = await http.post(Uri.parse("${Routes.addVooInPost}$postId"), headers: {
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) return;

      throw ApplicationErrorImp(
          mensagem: response.reasonPhrase.toString(),
          statusCode: response.statusCode);
    } catch (e) {
      throw ApplicationErrorImp(mensagem: e.toString(), statusCode: 500);
    }
  }

  Future removeVooInPost(int postId) async {
    try {
      String? token = AuthSingleton(LoginRepository()).getToken();

      var response = await http.delete(Uri.parse("${Routes.removeVooInPost}$postId"), headers: {
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) return;

      throw ApplicationErrorImp(
          mensagem: response.reasonPhrase.toString(),
          statusCode: response.statusCode);
    } catch (e) {
      throw ApplicationErrorImp(mensagem: e.toString(), statusCode: 500);
    }
  }
}