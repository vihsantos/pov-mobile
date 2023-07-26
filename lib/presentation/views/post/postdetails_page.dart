import 'package:flutter/material.dart';

class PostDetailsPage extends StatefulWidget {
  const PostDetailsPage({super.key});

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                width: size.width,
                height: 450,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 223, 222, 222),
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Icon(
                    Icons.panorama,
                    size: 128,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: size.height * 0.075,
                    width: size.width * 0.16,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "ana",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                          width: size.width * 0.718,
                          child: const Text(
                              "localização localização localização localização localização",
                              maxLines: 2))
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                  color: Colors.blue,
                  child: const Text(
                    "data data data data data data data data data data data data data data data data data data data data",
                    style: TextStyle(fontSize: 17),
                  )),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[300]),
                    child: Icon(Icons.comment),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[300]),
                    child: Icon(Icons.flight_sharp),
                  ),
                ],
              )
              //CardComment()
            ],
          ),
        ),
      ),
    );
  }
}
