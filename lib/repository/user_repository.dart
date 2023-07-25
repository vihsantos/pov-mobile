import 'package:dartz/dartz.dart';
import 'package:pov/dto/novousuario_dto.dart';
import 'package:pov/models/user/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<Either<Exception, User>> criarUsuario(NovoUsuarioDTO usuario) async {
    try {
      String url = "http://192.168.2.104:8000/criarusuario";

      var response =
          await http.post(Uri.parse(url), body: usuario.toJson(), headers: {
        "content-type": "application/json",
        "accept": "application/json",
      });
      if (response.statusCode == 200) {
        return Right(User.fromJson(response.body));
      }

      return Left(Exception(response.reasonPhrase));
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
