import 'package:flutter/material.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Filtrar Por:",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color(0xFF8C8C8C))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * 0.45,
                    height: size.height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.amber),
                  ),
                  Container(
                    width: size.width * 0.45,
                    height: size.height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.pink),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: size.width,
                height: size.height * 0.10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFFF8F8F8)),
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Nome do local",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.pink),
                        ),
                        RichText(
                          text: const TextSpan(
                            text: 'Mencionado por ',
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xFF393434)),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '40',
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.pink)),
                              TextSpan(
                                  text: " post's!",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF393434))),
                            ],
                          ),
                        )
                      ],
                    ),
                    Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: size.width * 0.2,
                          height: size.height * 0.042,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "200",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.star,
                                size: 22,
                                color: Colors.pink,
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              )
              // Container(
              //   width: 290,
              //   height: 360,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       image: const DecorationImage(
              //           fit: BoxFit.cover,
              //           image: NetworkImage(
              //               "https://www.voltologo.net/wp-content/uploads/2022/12/pelourinho-salvador-bahia.jpg"))),
              //   child: Stack(children: [
              //     Positioned(
              //       left: 0,
              //       bottom: 0,
              //       right: 0,
              //       child: Container(
              //         width: 300,
              //         height: 100,
              //         decoration: const BoxDecoration(
              //             color: Color.fromARGB(178, 255, 255, 255),
              //             borderRadius: BorderRadius.only(
              //                 bottomLeft: Radius.circular(10),
              //                 bottomRight: Radius.circular(10))),
              //         child: Padding(
              //           padding: const EdgeInsets.all(5),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Row(
              //                 children: [
              //                   Container(
              //                     width: 50,
              //                     height: 50,
              //                     decoration: BoxDecoration(
              //                         borderRadius: BorderRadius.circular(50),
              //                         color: Colors.blueGrey[900]),
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //     Positioned(
              //       top: 10,
              //       right: 10,
              //       child: Container(
              //         width: 60,
              //         height: 30,
              //         decoration: BoxDecoration(
              //             boxShadow: const [
              //               BoxShadow(
              //                   offset: Offset(0, 4),
              //                   blurRadius: 4,
              //                   color: Color.fromARGB(33, 0, 0, 0))
              //             ],
              //             color: Colors.white,
              //             borderRadius: BorderRadius.circular(10)),
              //         child: const Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           children: [
              //             Text(
              //               '5',
              //               style: TextStyle(
              //                   fontSize: 18,
              //                   fontWeight: FontWeight.bold,
              //                   color: Colors.pink),
              //             ),
              //             SizedBox(width: 5),
              //             Icon(
              //               Icons.star,
              //               size: 18,
              //               color: Colors.pink,
              //             )
              //           ],
              //         ),
              //       ),
              //     )
              //   ]),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
