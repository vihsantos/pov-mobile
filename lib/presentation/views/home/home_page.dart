import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:pov/presentation/widgets/bottom_navigation.dart';
import 'package:latlong2/latlong.dart';

import '../../widgets/card_destaque.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              "Home",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),
          ),
          backgroundColor: Colors.white,
          bottomNavigationBar: const BottomNavigation(),
          body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                margin: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 10, top: 10),
                height: 180,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FlutterMap(
                    options: MapOptions(
                        center: const LatLng(-12.9704, -38.5124), zoom: 15),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      )
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Destaques da semana:",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFF393434)),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CardDestaque(),
                        CardDestaque(),
                        CardDestaque(),
                        CardDestaque(),
                      ],
                    )),
              )
            ]),
          )),
    );
  }
}
