// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pov/dto/trail_dto.dart';
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
    //var urls = trilha.files!.split(";");
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(10),
      width: size.width,
      height: size.height * 0.34,
      decoration: BoxDecoration(
          color: ColorPallete.bgItemColor,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Center(
            child: Text(
              trilha.name!,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: ColorPallete.labelColor),
            ),
          ),
          const Text(
            "AREA DE ATUAÇÃO, AREA DE ATUAÇÃO, AREA DE ATUAÇÃO, AREA DE ATUAÇÃO, AREA DE ATUAÇÃO, AREA DE ATUAÇÃO",
            maxLines: 2,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: ColorPallete.labelColor),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            trilha.description!,
            maxLines: 3,
            style: const TextStyle(
                color: ColorPallete.primaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
