import 'package:flutter/material.dart';

class CardPost extends StatelessWidget {
  const CardPost({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
      width: size.width,
      height: size.height * 0.5,
      decoration: BoxDecoration(
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://a.cdn-hotels.com/gdcs/production42/d500/8f83cf87-3f2a-4c7b-8a26-766b94cc5c4e.jpg?impolicy=fcrop&w=800&h=533&q=medium")),
          color: Colors.amber,
          borderRadius: BorderRadius.circular(10)),
      child: Stack(children: [
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            width: size.width * 0.155,
            height: size.height * 0.04,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  color: Color.fromARGB(33, 0, 0, 0))
            ], color: Colors.white, borderRadius: BorderRadius.circular(6)),
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
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
                padding: const EdgeInsets.all(5),
                width: size.width,
                height: size.height * 0.16,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(206, 255, 255, 255),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    border: Border.all(
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: const Color.fromARGB(24, 255, 255, 255),
                        width: 2)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: size.width * 0.12,
                              height: size.height * 0.06,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(size.width)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "username",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: size.width * 0.6,
                                  child: const Text(
                                    "localization",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          width: size.width * 0.11,
                          height: size.height * 0.06,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: const AssetImage("asset/img/voo_selected.png"),
                                width: size.width * 0.055,
                                fit: BoxFit.cover,
                                ),
                              // Icon(
                              //   Icons.flight,
                              //   size: 18,
                              // ),
                              const Text(
                                "2K",
                                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "data data data data data data data data data data data data",
                      maxLines: 3,
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                )))
      ]),
    );
  }
}
