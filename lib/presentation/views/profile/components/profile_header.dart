import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          width: 100,
          height: 110,
          child: Column(
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
              width: 120,
              height: 120,
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
            Visibility(
              visible: false,
              child: Container(
                width: 180,
                height: 50,
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
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                )),
              ),
            )
          ],
        ),
        const SizedBox(
          width: 100,
          height: 110,
          child: Column(
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
