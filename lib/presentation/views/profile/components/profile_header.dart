import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         SizedBox(
          width: size.width *0.28,
          height: size.height * 0.08,
          child: const Column(
            children: [
              Text(
                "120",
                style: TextStyle(fontSize: 22),
              ),
              Text("Seguindo",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16))
            ],
          ),
        ),
        Column(
          children: [
            Container(
              width: size.width * 0.3,
              height: size.height * 0.15,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(75)),
            ),
            const SizedBox(height: 10),
            const Text(
              "leandra",
              style: TextStyle(
                  color: Color(0xFF393434),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Visibility(
              visible: true,
              child: Container(
                width: size.width * 0.35,
                height: size.height * 0.06,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFFE8C261), Color(0xFFE86161)]),
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
          width: size.width *0.28,
          height: size.height * 0.08,
          child: const Column(
            children: [
              Text(
                "240",
                style: TextStyle(fontSize: 22),
              ),
              Text("Seguidores",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16))
            ],
          ),
        ),
      ],
    );
  }
}
