import 'package:pov/models/enums/AreaAtuacao.dart';

class Utils {
  static String data(DateTime data) {
    int dia = data.day;
    int mes = data.month;
    int ano = data.year;

    String diaa = "";
    String mess = "";

    if (dia < 10) {
      diaa = "0$dia";
    } else {
      diaa = dia.toString();
    }

    if (mes < 10) {
      mess = "0$mes";
    } else {
      mess = mes.toString();
    }

    String result = "$diaa/$mess/$ano";
    return result;
  }

  static String descricaoAreaAtuacao(String areas) {
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

    areaas = areaas.substring(0, areaas.length - 2);

    return areaas;
  }

  static List<String> listarUFs() {
    List<String> ufs = [
      "AC",
      "AL",
      "AP",
      "AM",
      "BA",
      "CE",
      "DF",
      "ES",
      "GO",
      "MA",
      "MT",
      "MS",
      "MG",
      "PA",
      "PB",
      "PR",
      "PE",
      "PI",
      "RJ",
      "RN",
      "RS",
      "RO",
      "RR",
      "SC",
      "SP",
      "SE",
      "TO"
    ];
    return ufs;
  }

  static String vooselected = "asset/img/voo_selected.png"; 
  static String voounselected = "asset/img/voo_unselected.png";
}
