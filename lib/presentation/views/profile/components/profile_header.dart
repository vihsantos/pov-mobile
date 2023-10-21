// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pov/dto/dadosperfil_dto.dart';

class ProfileHeader extends StatelessWidget {
  final bool isprofileuser;
  final DadosPerfilDTO dados;

  const ProfileHeader({
    Key? key,
    required this.isprofileuser,
    required this.dados,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width * 0.28,
          height: size.height * 0.08,
          child: Column(
            children: [
              Text(
                dados.following!.length.toString(),
                style: const TextStyle(fontSize: 22),
              ),
              const Text("Seguindo",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16))
            ],
          ),
        ),
        Column(
          children: [
            Container(
              width: size.width * 0.3,
              height: size.height * 0.14,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(75)),
            ),
            const SizedBox(height: 10),
            Text(
              dados.username!,
              style: const TextStyle(
                  color: Color(0xFF393434),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Visibility(
              visible: !isprofileuser,
              child: Container(
                width: size.width * 0.35,
                height: size.height * 0.05,
                decoration: BoxDecoration(
                    color: const Color(0xFF6461E8),
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text(
                  "Seguir",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )),
              ),
            )
          ],
        ),
        SizedBox(
          width: size.width * 0.28,
          height: size.height * 0.08,
          child: Column(
            children: [
              Text(
                dados.followers!.length.toString(),
                style: const TextStyle(fontSize: 22),
              ),
              const Text("Seguidores",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16))
            ],
          ),
        ),
      ],
    );
  }
}
