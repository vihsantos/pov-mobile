import 'package:flutter/material.dart';

import '../../../../services/core/colorpallete.dart';

class TrailCard extends StatelessWidget {
  const TrailCard({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(10),
      width: size.width,
      height: size.height * 0.38,
      decoration: BoxDecoration(
          color: ColorPallete.bgItemColor,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          const Center(
            child: Text(
              "Nome da Trilha",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: ColorPallete.labelColor),
            ),
          ),
          SizedBox(
            height: size.height * 0.2,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: size.width * 0.35,
                    height: size.height * 0.175,
                    decoration: BoxDecoration(
                        color: ColorPallete.bgColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: size.width * 0.35,
                    height: size.height * 0.175,
                    decoration: BoxDecoration(
                        color: ColorPallete.bgColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: size.width * 0.35,
                    height: size.height * 0.175,
                    decoration: BoxDecoration(
                        color: ColorPallete.bgColor,
                        borderRadius: BorderRadius.circular(10)),
                  )
                ],
              ),
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
          const Text(
            "DESCRIÇÃO DA TRILHA DESCRIÇÃO DA TRILHA DESCRIÇÃO DA TRILHA DESCRIÇÃO DA TRILHA DESCRIÇÃO DA TRILHA", 
            maxLines: 3,
            style: TextStyle(
            color: ColorPallete.primaryColor,
            fontSize: 12,
            fontWeight: FontWeight.w500
          ),)
        ],
      ),
    );
  }
}
