import 'dart:convert';

import 'package:pov/dto/municipio_dto.dart';
import 'package:pov/services/core/routes.dart';
import 'package:http/http.dart' as http;



class MunicipioRepository{

  // ignore: non_constant_identifier_names
  Future<List<MunicipioDTO>?> buscarMunicipiosPorUF(String UF) async {

    String route = "${Routes.municipioPorUF}$UF/municipios";

    var response = await http.get(Uri.parse(route), headers: {
        "content-type": "application/json",
        "accept": "application/json",
      });

      if (response.statusCode == 200) {
        Iterable lista = json.decode(response.body);
        List<MunicipioDTO> municipios = [];

        for (var element in lista) {
          municipios.add(MunicipioDTO.fromMap(element));
        }

        return municipios;
      }
      return null;

  }

}