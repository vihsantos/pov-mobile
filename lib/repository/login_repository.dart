import 'package:http/http.dart' as http;
import 'package:pov/services/core/routes.dart';
import '../models/login/acess_model.dart';
import '../models/login/login_model.dart';
import '../services/error/applicationerrorimp.dart';

class LoginRepository {
  Future<AcessModel> logar(LoginModel login) async {
    try {
      String url = Routes.login;

      var response =
          await http.post(Uri.parse(url), body: login.toJson(), headers: {
        "content-type": "application/json",
        "accept": "application/json",
      });

      if (response.statusCode == 200) {
        return AcessModel.fromJson(response.body);
      }

      throw ApplicationErrorImp(
          mensagem: response.reasonPhrase.toString(),
          statusCode: response.statusCode);
    } catch (e) {
      throw ApplicationErrorImp(mensagem: e.toString(), statusCode: 500);
    }
  }
}
