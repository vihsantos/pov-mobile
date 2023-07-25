import 'package:flutter/material.dart';

import '../../post/postdetails_page.dart';

class CardPostProfile extends StatelessWidget {
  const CardPostProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PostDetailsPage()));
      },
      child: Padding(
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
      ),
    );
  }
}
