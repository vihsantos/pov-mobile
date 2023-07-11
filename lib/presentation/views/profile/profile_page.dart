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
                  Container(
                    width: 100,
                    height: 110,
                    child: const Column(
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
                  Container(
                    width: 100,
                    height: 110,
                    child: const Column(
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
            Container(
              height: 510,
              color: Color.fromARGB(255, 238, 237, 237),
            )
          ],
        ),
      ),
    );
  }
}
