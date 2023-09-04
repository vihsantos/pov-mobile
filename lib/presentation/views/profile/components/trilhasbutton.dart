import 'package:flutter/material.dart';

import '../../trails/trails_page.dart';

class TrilhasButton extends StatelessWidget {
  const TrilhasButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TrailsPage()));
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 0.2,
              color: const Color.fromARGB(255, 36, 36, 36),
            ),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(125, 192, 192, 192),
                  offset: Offset(0, 4),
                  blurRadius: 15)
            ]),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.map_rounded, size: 46),
            Text(
              "Trilhas",
              style: TextStyle(fontWeight: FontWeight.w900),
            )
          ],
        ),
      ),
    );
  }
}
