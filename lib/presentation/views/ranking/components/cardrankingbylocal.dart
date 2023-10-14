import 'package:flutter/material.dart';

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
      height: size.height * 0.10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xFFF8F8F8)),
      padding: EdgeInsets.all(10),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.local!,
                maxLines: 2,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.pink),
              ),
              RichText(
                text: TextSpan(
                  text: 'Mencionado por ',
                  style: const TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xFF393434)),
                  children: <TextSpan>[
                    TextSpan(
                        text: data.quantidade.toString(),
                        style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                            color: Colors.pink)),
                    const TextSpan(
                        text: " post's!",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 16,
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
                height: size.height * 0.042,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
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
