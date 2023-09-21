// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pov/presentation/controllers/postpage_controller.dart';
import 'package:pov/repository/post_repository.dart';

import '../../../models/post/post_model.dart';

class PostDetailsPage extends StatefulWidget {
  final int id;
  const PostDetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  PostPageController controller =
      PostPageController(repository: PostRepository());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: FutureBuilder<PostModel?>(
                future: controller.buscarPostPorID(widget.id),
                builder: (context, snapshot) {
                  PostModel? post = snapshot.data;

                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    return const Text("Ocorreu um erro!");
                  }

                  if (snapshot.data == null) {
                    return const Text("Ocorreu um erro!");
                  }

                  return Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: size.width,
                            height: 450,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                post!.image_url!,
                                fit: BoxFit.cover,
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
                                height: size.height * 0.074,
                                width: size.width * 0.16,
                                decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    post.user!.username!,
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                      width: size.width * 0.718,
                                      child: Text(
                                          post.localizacao ?? "Não informado",
                                          maxLines: 2))
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            post.description!,
                            style: const TextStyle(fontSize: 17),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          //CardComment()
                        ],
                      ),
                      Positioned(
                        top: 5,
                        left: 5,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: size.width * 0.135,
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: const Icon(Icons.arrow_back_ios_rounded),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: size.width * 0.20,
                            height: size.height * 0.055,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "5",
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
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
                      ),
                    ],
                  );
                })),
      ),
    );
  }
}
