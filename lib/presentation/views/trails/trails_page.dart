import 'package:flutter/material.dart';

import 'newtrail_page.dart';

class TrailsPage extends StatefulWidget {
  const TrailsPage({super.key});

  @override
  State<TrailsPage> createState() => _TrailsPageState();
}

class _TrailsPageState extends State<TrailsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Trilhas de username",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(children: [
        Container(
          margin: const EdgeInsets.all(15),
          width: size.width,
          height: size.height * 0.25,
          decoration: BoxDecoration(
              color: Colors.pink, borderRadius: BorderRadius.circular(10)),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NewTrailPage()));
          },
          child: Container(
            width: 150,
            height: 150,
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: const Color(0xFFF8F8F8),
                borderRadius: BorderRadius.circular(10)),
            child: const Center(
              child: Icon(Icons.add, size: 60),
            ),
          ),
        )
      ]),
    );
  }
}
