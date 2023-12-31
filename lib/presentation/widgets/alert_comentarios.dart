import 'package:flutter/material.dart';

import '../../services/core/colorpallete.dart';

class AlertComentarios extends StatelessWidget {
  const AlertComentarios({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: 650,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: ColorPallete.bgItemColor,
            borderRadius: BorderRadius.circular(60)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              children: [
                const Text(
                  "Comentários",
                  style: TextStyle(
                      fontSize: 20,
                      color: ColorPallete.labelColor,
                      fontWeight: FontWeight.bold),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: size.width,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 198, 198, 226),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      children: [
                        Container(
                          color: Colors.white,
                          width: size.width * 0.75,
                        ),
                        IconButton(onPressed: (){}, icon: Icon(Icons.send, color: ColorPallete.primaryColor,))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}