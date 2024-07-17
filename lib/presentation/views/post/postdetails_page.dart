// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:pov/presentation/controllers/commentpage_controller.dart';
import 'package:pov/presentation/controllers/postpage_controller.dart';
import 'package:pov/presentation/views/init_page.dart';
import 'package:pov/repository/comment_repository.dart';
import 'package:pov/repository/post_repository.dart';
import 'package:pov/services/core/colorpallete.dart';
import 'package:pov/services/core/utils.dart';

import '../../../models/post/post_model.dart';
import '../../widgets/alert_comentarios.dart';

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

  CommentPageController commentController =
      CommentPageController(repository: CommentRepository());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
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
                              height: size.height * 0.5,
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
                                post.user!.profile != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: SizedBox(
                                            width: size.width * 0.15,
                                            height: size.height * 0.076,
                                            child: Image.network(
                                              post.user!.profile!,
                                              fit: BoxFit.cover,
                                            )),
                                      )
                                    : Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            color: ColorPallete.bgItemColor),
                                        child: const Center(
                                            child: Icon(
                                          Icons.person,
                                          size: 38,
                                          color: ColorPallete
                                              .bottomUnselectedColor,
                                        )),
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
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                        width: size.width * 0.718,
                                        child: Text(
                                          post.localization!.local!,
                                          maxLines: 2,
                                          style: const TextStyle(fontSize: 13),
                                        ))
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
                            Row(
                              children: [
                                Container(
                                  width: 70,
                                  height: 75,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                            color:
                                                Color.fromARGB(47, 49, 49, 49),
                                            blurRadius: 5,
                                            offset: Offset(2, 2))
                                      ],
                                      color: ColorPallete.bgItemColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            height: 30,
                                            child: Image.asset(
                                                Utils.voounselected)),
                                        Text(
                                          "${post.voos!.length}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: ColorPallete.secondColor,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () async {
                                    if (!mounted) return;

                                    commentController.comment.post_id =
                                        widget.id;

                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) => AlertComentarios(
                                              controller: commentController,
                                            ));
                                  },
                                  child: Container(
                                    width: 70,
                                    height: 75,
                                    decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Color.fromARGB(
                                                  47, 49, 49, 49),
                                              blurRadius: 5,
                                              offset: Offset(2, 2))
                                        ],
                                        color: ColorPallete.bgItemColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.comment_rounded,
                                          size: 30,
                                          color: ColorPallete.secondColor,
                                        ),
                                        Text(
                                          "${post.comentarios!}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: ColorPallete.secondColor,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Visibility(
                                    visible:
                                        controller.isProfile(post.user!.id!),
                                    child: InkWell(
                                      onTap: () async {
                                        return showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: SizedBox(
                                                  height: 50,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      InkWell(
                                                        onTap: () async {
                                                          bool excluido =
                                                              await controller
                                                                  .excluirPost(
                                                                      widget
                                                                          .id);

                                                          if (excluido) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    const SnackBar(
                                                                        content:
                                                                            Text("Post excluído com sucesso!")));
                                                          }

                                                          Navigator.pushAndRemoveUntil(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          InitPage()),
                                                              (Route<dynamic>
                                                                      route) =>
                                                                  false);
                                                        },
                                                        child: const Center(
                                                          child: Text(
                                                            "Excluir",
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: ColorPallete
                                                                    .labelColor),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      child: Container(
                                        width: 70,
                                        height: 75,
                                        decoration: BoxDecoration(
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Color.fromARGB(
                                                      47, 49, 49, 49),
                                                  blurRadius: 5,
                                                  offset: Offset(2, 2))
                                            ],
                                            color: ColorPallete.bgItemColor,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Center(
                                          child: Icon(Icons.more_vert_rounded,
                                              color: ColorPallete.secondColor),
                                        ),
                                      ),
                                    ))
                              ],
                            )
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
                              width: size.width * 0.13,
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
                          child: Container(
                            width: size.width * 0.20,
                            height: size.height * 0.05,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  post.stars.toString(),
                                  style: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.pink),
                                ),
                                const Icon(
                                  Icons.star,
                                  size: 26,
                                  color: Colors.pink,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  })),
        ),
      ),
    );
  }
}
