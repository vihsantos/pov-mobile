import 'package:flutter/material.dart';
import 'package:pov/services/core/colorpallete.dart';
import 'package:pov/services/core/utils.dart';

class CardPost extends StatelessWidget {
  const CardPost({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.49,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 226, 199, 231),
          borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              width: size.width * 0.20,
              height: size.height * 0.05,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "0",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        color: Colors.pink),
                  ),
                  Icon(
                    Icons.star,
                    size: 26,
                    color: Colors.pink,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: size.width * 0.957,
              height: size.height * 0.15,
              decoration: const BoxDecoration(
                color: Color.fromARGB(61, 246, 246, 252),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(40)
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: size.width * 0.595,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("username", style: TextStyle(color: ColorPallete.labelColor, fontWeight: FontWeight.bold, fontSize: 16)),
                              Text("localização", maxLines: 2, style: TextStyle(color: ColorPallete.labelColor, fontSize: 12)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 55,
                          height: 60,
                          decoration: BoxDecoration(
                            color: ColorPallete.bgItemColor,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 35,
                                child: Image.asset(Utils.vooselected)),
                              Text("0", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: ColorPallete.secondColor),)
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text("descrição", maxLines: 3,)
                  ],
                ),
              ),
            ))
        ],
      ),
    );
  }
}
