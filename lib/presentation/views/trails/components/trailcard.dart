// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pov/dto/trail_dto.dart';
import 'package:pov/presentation/views/trails/traildetails_page.dart';
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

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TrailDetailsPage(id: trilha.id!)));
      },
      child: Container(
        width: size.width * 0.94,
        height: size.height * 0.34,
        decoration: BoxDecoration(
          color: ColorPallete.bgItemColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: size.width * 0.87,
                height: 195,
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: urls.length,
                  controller: PageController(viewportFraction: 1),
                  itemBuilder: (BuildContext context, int itemIndex) {
                    return Image.network(
                      urls[itemIndex],
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            Text(trilha.name!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: ColorPallete.secondColor),
                maxLines: 2,
                textAlign: TextAlign.center),
            Text(
              areaas,
              maxLines: 2,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: ColorPallete.labelColor),
            ),
            SizedBox(
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(width: 40, height: 40, color: Colors.red),
                    const SizedBox(width: 10),
                    Text(trilha.user!.username!)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
