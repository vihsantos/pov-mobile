import 'package:flutter/material.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
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
              "Ranking",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
        body:  const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Text("5 ESTRELAS",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18
                ),),
              ],
            ),
          ),
        ),
      ),
    );

  }
}