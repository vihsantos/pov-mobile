import 'package:flutter/material.dart';

class CardDestaque extends StatelessWidget {
  const CardDestaque({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Stack(children: [
        Container(
          width: 180,
          height: 260,
          decoration: BoxDecoration(
              color: const Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 160,
                height: 160,
                margin: const EdgeInsets.only(top: 10, left: 10),
                decoration: BoxDecoration(
                    color: Colors.purpleAccent[700],
                    borderRadius: BorderRadius.circular(10)),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("ana"),
                        Text(
                          "Praia de Itapuã, Salvador",
                          maxLines: 2,
                          style: TextStyle(fontSize: 9),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text("Lorem ipsum dolor sit amet consectetur..."),
              )
            ],
          ),
        ),
        Positioned(
          top: 15,
          right: 15,
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
