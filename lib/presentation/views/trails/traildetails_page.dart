// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pov/services/core/colorpallete.dart';

class TrailDetailsPage extends StatefulWidget {
  final int id;
  const TrailDetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<TrailDetailsPage> createState() => _TrailDetailsPageState();
}

class _TrailDetailsPageState extends State<TrailDetailsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
                child: Column(
          children: [
            const Text(
              "nome da trilha",
              style: TextStyle(
                  color: ColorPallete.labelColor, fontWeight: FontWeight.w600, fontSize: 18),
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(20),
                  width: size.width,
                  height: size.height * 0.3,
                  decoration: BoxDecoration(
                      color: ColorPallete.bgItemColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.network(
                    "https://salvadordabahia.b-cdn.net/wp-content/uploads/2020/08/elevador-lacerda-foto_-uiler-costa-768x600.jpg",
                    fit: BoxFit.cover,),
                ),
                Positioned(
                  bottom: 15,
                  left: size.width * 0.45,
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber
                        ),
                      ),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
                ),
              ),
        ));
  }
}
