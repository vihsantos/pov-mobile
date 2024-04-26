import 'package:pov/models/enums/AreaAtuacao.dart';

class Utils{

  static String data(DateTime data){
    int dia = data.day;
    int mes = data.month;
    int ano = data.year;

    String result = "$dia/$mes/$ano";
    return result;
  }

  static String descricaoAreaAtuacao(String areas){
    var numAreas = areas.split(";");
    List<AreaAtuacao> areaatuacao = List.empty(growable: true);
    String areaas = "";

    for (var area in numAreas) {
      String numero = area.trim();

      if (numero.isNotEmpty) {
        AreaAtuacao a = AreaAtuacao.values.elementAt(int.parse(area.trim()));
        areaatuacao.add(a);
      }
    }

    for (var element in areaatuacao) {
      areaas += "${element.descricao} - ";
    }

    areaas = areaas.substring(0, areaas.length -2);

    return areaas;
  }
}