import 'package:flutter/material.dart';
import 'package:pov/presentation/views/guides/components/profileiconcard.dart';

import '../../../../dto/guide_dto.dart';

class GuideCard extends StatelessWidget {
  final GuideDTO guia;
  const GuideCard({
    super.key, required this.guia,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 236, 240, 239),
      ),
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
                    fontSize: 20, fontWeight: FontWeight.bold)),
            Text(guia.guide!.areaatuacao!),
            Container(
              width: 120,
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                  child: Text(
                "Seguir",
                style: TextStyle(color: Colors.white),
              )),
            )
          ],
        ),
      ),
    );
  }
}