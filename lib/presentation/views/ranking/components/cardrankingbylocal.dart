import 'package:flutter/material.dart';
import 'package:pov/services/core/colorpallete.dart';

import '../../../../models/ranking/rankingbylocal_model.dart';

class CardRankingByLocal extends StatelessWidget {
  const CardRankingByLocal({
    Key? key,
    required this.data,
  }) : super(key: key);

  final RankingByLocalModel data;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.18,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xFFF8F8F8),
          border: Border.all(color: const Color(0xFFEDEDED), width: 0.5)),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(15),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width * 0.68,
                child: Text(
                  data.local!,
                  maxLines: 3,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: ColorPallete.primaryColor),
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Mencionado por ',
                  style: const TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xFF393434)),
                  children: <TextSpan>[
                    TextSpan(
                        text: data.quantidade.toString(),
                        style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: Colors.pink)),
                    const TextSpan(
                        text: " post's!",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF393434))),
                  ],
                ),
              )
            ],
          ),
          Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: size.width * 0.2,
                height: size.height * 0.055,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: const Color(0xFFEDEDED), width: 0.5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      data.stars.toString(),
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink),
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.star,
                      size: 22,
                      color: Colors.pink,
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
