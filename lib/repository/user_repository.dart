import 'package:http/http.dart';
import 'package:pov/dto/infoguide_dto.dart';
import 'package:pov/dto/novousuario_dto.dart';
import 'package:http/http.dart' as http;
import 'package:pov/services/core/routes.dart';
import '../dto/dadosperfil_dto.dart';
import '../services/error/applicationerrorimp.dart';
import '../services/singleton/auth_singleton.dart';
import 'login_repository.dart';

class UserRepository {
  Future<bool?> criarUsuario(NovoUsuarioDTO usuario) async {
    try {
      String url = Routes.novoUsuario;

      var response =
          await http.post(Uri.parse(url), body: usuario.toJson(), headers: {
        "content-type": "application/json",
        "accept": "application/json",
      });

      if (response.statusCode == 201) return true;

      throw ApplicationErrorImp(
          mensagem: response.reasonPhrase.toString(),
          statusCode: response.statusCode);
    } catch (e) {
      throw ApplicationErrorImp(mensagem: e.toString(), statusCode: 500);
    }
  }

  Future<DadosPerfilDTO> buscarDadosPerfil(int id) async {
    try {
      String url = "${Routes.usuario}$id";

      String? token = AuthSingleton(LoginRepository()).getToken();

      var response = await http.get(Uri.parse(url), headers: {
        "content-type": "application/json",
        "accept": "application/json",
        "Authorization": "Bearer $token",
      });

      if (response.statusCode == 200) {
        return DadosPerfilDTO.fromJson(response.body);
      }

      throw ApplicationErrorImp(
          mensagem: response.reasonPhrase.toString(),
          statusCode: response.statusCode);
    } catch (e) {
      throw ApplicationErrorImp(mensagem: e.toString(), statusCode: 500);
    }
  }

  Future<bool> alterarFotoPerfil(MultipartFile pic) async {
    try {
      String? token = AuthSingleton(LoginRepository()).getToken();

      var request = MultipartRequest("POST", Uri.parse(Routes.addicon));

      request.headers.addAll({
        "content-type": "application/json",
        "accept": "application/json",
        'Authorization': 'Bearer $token',
      });

      request.files.add(pic);

      var response = await request.send();
      if (response.statusCode == 200) return true;

      return false;
    } catch (e) {
      throw ApplicationErrorImp(mensagem: e.toString(), statusCode: 500);
    }
  }

  Future<InfoGuideDTO?> buscarInformacoesGuia(int user) async {
    try {
      String url = "${Routes.infoGuide}/$user";

      String? token = AuthSingleton(LoginRepository()).getToken();

      var response = await http.get(Uri.parse(url), headers: {
        "content-type": "application/json",
        "accept": "application/json",
        "Authorization": "Bearer $token",
      });

      if(response.statusCode == 200){
        return InfoGuideDTO.fromJson(response.body);
      }

      
    } catch (e) {
      throw ApplicationErrorImp(mensagem: e.toString(), statusCode: 500);
    }
    return null;
  }

  Future<bool?> isUserGuide(int user) async{
    try{
      String url = "${Routes.isGuide}/$user";

      String? token = AuthSingleton(LoginRepository()).getToken();

      var response = await http.get(Uri.parse(url), headers: {
        "content-type": "application/json",
        "accept": "application/json",
        "Authorization": "Bearer $token",
      });

      if(response.statusCode == 200){
        bool isGuide = bool.parse(response.body.trim());
        return isGuide;
      }

    }catch (e) {
      throw ApplicationErrorImp(mensagem: e.toString(), statusCode: 500);
    }
    return null;
  }
}
