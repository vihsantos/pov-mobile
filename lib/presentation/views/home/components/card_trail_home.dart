// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pov/dto/trail_dto.dart';

class CardTrailHome extends StatelessWidget {
  final TrailDTO trilha;

  const CardTrailHome({
    Key? key,
    required this.trilha,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.65,
      height: size.height * 0.21,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFF8F8F8)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: size.width * 0.30,
                height: size.height * 0.145,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.orangeAccent),
              ),
              SizedBox(
                width: size.width * 0.30,
                height: size.height * 0.145,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(trilha.user!.username!),
                    Text(trilha.name!,
                        maxLines: 2,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14)),
                    Text(trilha.description!,
                        maxLines: 5,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 10))
                  ],
                ),
              )
            ],
          ),
          // const Text(
          //   "localização, localização, localização localização",
          //   maxLines: 2,
          //   style: TextStyle(fontSize: 12),
          // )
        ],
      ),
    );
  }
}
