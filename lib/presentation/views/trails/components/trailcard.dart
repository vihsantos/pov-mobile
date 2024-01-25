// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pov/dto/trail_dto.dart';
import '../../../../models/enums/AreaAtuacao.dart';
import '../../../../services/core/colorpallete.dart';

class TrailCard extends StatelessWidget {
  final TrailDTO trilha;

  const TrailCard({
    Key? key,
    required this.trilha,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var urls = trilha.files!.split(";");
    urls.removeLast();

    var numAreas = trilha.occupation!.split(";");
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

    return Container(
      padding: const EdgeInsets.all(10),
      width: size.width * 0.95,
      height: size.height * 0.3,
      decoration: BoxDecoration(
          color: ColorPallete.bgItemColor,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Container(
            width: size.width * 0.46,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image.network(
              urls[0],
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 5),
          SizedBox(
            width: size.width * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 4, 81, 119),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text(trilha.user!.username!)],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  trilha.name!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: ColorPallete.labelColor),
                ),
                Text(
                  areaas,
                  maxLines: 4,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: ColorPallete.labelColor),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  trilha.description!,
                  maxLines: 6,
                  style: const TextStyle(
                      color: ColorPallete.primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
