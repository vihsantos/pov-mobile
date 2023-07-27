import 'package:flutter/material.dart';

import '../../widgets/bottom_navigation.dart';
import 'components/card_postprofile.dart';

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
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   centerTitle: true,
        //   title: const Text(
        //     "Perfil",
        //     style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        //   ),
        // ),
        bottomNavigationBar: const BottomNavigation(),
        body: Column(
          children: [
            SizedBox(height: 15),
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
                          style: TextStyle(fontSize: 22),
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
                                  colors: [
                                    Color(0xFFE8C261),
                                    Color(0xFFE86161)
                                  ]),
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
            Expanded(
              child: GridView.count(
                scrollDirection: Axis.vertical,
                shrinkWrap: false,
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
