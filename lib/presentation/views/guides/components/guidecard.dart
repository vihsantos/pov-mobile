import 'package:flutter/material.dart';
import 'package:pov/models/enums/AreaAtuacao.dart';
import 'package:pov/presentation/views/guides/components/profileiconcard.dart';
import 'package:pov/presentation/views/profile/profile_page.dart';
import 'package:pov/services/core/utils.dart';

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
                Utils.descricaoAreaAtuacao(guia.guide!.areaatuacao!),
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
