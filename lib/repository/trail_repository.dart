import 'package:http/http.dart';
import 'package:pov/dto/trail_dto.dart';

import '../services/core/routes.dart';
import '../services/singleton/auth_singleton.dart';
import 'login_repository.dart';

class TrailRepository {
  Future<bool> criarNovaTrilha(List<MultipartFile> pics, TrailDTO model) async {
    final uri = Uri.parse(Routes.trail);
    String? token = AuthSingleton(LoginRepository()).getToken();

    Map<String, String> fields = {"dados": model.toJson().toString()};

    var request = MultipartRequest("POST", uri);

    request.headers.addAll({
      "content-type": "application/json",
      "accept": "application/json",
      'Authorization': 'Bearer $token',
    });

    request.fields.addAll(fields);

    request.files.addAll(pics);

    var response = await request.send();
    if (response.statusCode == 200) return true;

    return false;
  }
}
