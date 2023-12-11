import 'package:flutter/material.dart';
import 'package:pov/services/core/colorpallete.dart';
import 'components/buttonnewtrail.dart';
import 'components/trailcard.dart';

class TrailsPage extends StatefulWidget {
  const TrailsPage({super.key});

  @override
  State<TrailsPage> createState() => _TrailsPageState();
}

class _TrailsPageState extends State<TrailsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Trilhas de username",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.75,
                  child: const Text(
                    "Esta é uma listagem das suas trilhas, se deseja adicionar mais alguma, clique no botão ao lado.",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: ColorPallete.secondColor),
                  ),
                ),
                const ButtonNewTrail()
              ],
            ),
          ),
          const TrailCard(),
        ]),
      ),
    );
  }
}

