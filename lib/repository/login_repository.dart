import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../models/login/acess_model.dart';
import '../models/login/login_model.dart';

class LoginRepository {
  Future<Either<Exception, AcessModel>> logar(LoginModel login) async {
    try {
      String url = "http://192.168.2.104:8000/acesso";

      var response =
          await http.post(Uri.parse(url), body: login.toJson(), headers: {
        "content-type": "application/json",
        "accept": "application/json",
      });

      if (response.statusCode == 200) {
        return Right(AcessModel.fromJson(response.body));
      }

      return Left(Exception(response.reasonPhrase));
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
