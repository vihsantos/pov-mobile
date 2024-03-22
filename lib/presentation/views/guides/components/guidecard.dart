import 'package:flutter/material.dart';
import 'package:pov/models/enums/AreaAtuacao.dart';
import 'package:pov/presentation/views/guides/components/profileiconcard.dart';
import 'package:pov/presentation/views/profile/profile_page.dart';

import '../../../../dto/guide_dto.dart';

class GuideCard extends StatelessWidget {
  final GuideDTO guia;
  const GuideCard({
    super.key,
    required this.guia,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var numAreas = guia.guide!.areaatuacao!.split(";");
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

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProfilePage(isGuide: true, id: guia.user!.id!)));
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: const Color(0xFF6461E8), width: 0.05),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(255, 236, 240, 239),
                  offset: Offset(0, 4),
                  blurRadius: 10)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileIconCard(
                  username: guia.user!.username!,
                  profileIcon: guia.user?.profileicon),
              Text(guia.user!.username!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              Text(
                areaas,
                style: const TextStyle(fontSize: 10),
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: size.height * 0.005,
              )
              // ,
              // Container(
              //   width: size.width * 0.5,
              //   height: size.height * 0.05,
              //   decoration: BoxDecoration(
              //       color: const Color(0xFF6461E8),
              //       borderRadius: BorderRadius.circular(10)),
              //   child: const Center(
              //       child: Text(
              //     "Seguir",
              //     style: TextStyle(color: Colors.white),
              //   )),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
