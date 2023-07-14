import 'package:flutter/material.dart';

import '../../widgets/bottom_navigation.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Perfil",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
          ),
        ),
        bottomNavigationBar: const BottomNavigation(),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
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
                          style: TextStyle(fontSize: 26),
                        ),
                        Text("Seguindo",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16))
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
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
                      )
                    ],
                  ),
                  const SizedBox(
                    child: Column(
                      children: [
                        Text(
                          "240",
                          style: TextStyle(fontSize: 26),
                        ),
                        Text("Seguidores",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 510,
              child: GridView.count(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                crossAxisCount: 2,
                children: const [
                  CardPostProfile(),
                  CardPostProfile(),
                  CardPostProfile(),
                  CardPostProfile(),
                  CardPostProfile()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardPostProfile extends StatelessWidget {
  const CardPostProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 227, 225),
              borderRadius: BorderRadius.circular(10)),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            width: 60,
            height: 30,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  color: Color.fromARGB(33, 0, 0, 0))
            ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "5",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.star,
                  size: 18,
                  color: Colors.pink,
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
