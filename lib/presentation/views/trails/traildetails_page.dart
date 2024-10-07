// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:pov/models/trails/trail_model.dart';
import 'package:pov/presentation/controllers/trailpage_controller.dart';
import 'package:pov/presentation/views/init_page.dart';
import 'package:pov/presentation/widgets/alert_comentarios.dart';
import 'package:pov/repository/comment_repository.dart';
import 'package:pov/repository/trail_repository.dart';
import 'package:pov/services/core/utils.dart';
import '../../../services/core/colorpallete.dart';
import '../../controllers/commentpage_controller.dart';

class TrailDetailsPage extends StatefulWidget {
  final int id;
  const TrailDetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<TrailDetailsPage> createState() => _TrailDetailsPageState();
}

class _TrailDetailsPageState extends State<TrailDetailsPage> {
  int indexSelecionado = 0;

  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(
      initialPage: indexSelecionado,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TrailPageController controller =
        TrailPageController(repository: TrailRepository());

    CommentPageController commentController =
        CommentPageController(repository: CommentRepository());

    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: FutureBuilder<TrailModel?>(
              future: controller.buscarTrilhaPorID(widget.id),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                TrailModel? trail = snapshot.data;

                if (trail != null) {
                  var urls = trail.files!.split(";");
                  urls.removeLast();

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Center(
                        child: SizedBox(
                          width: size.width * 0.95,
                          height: 460,
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 440,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: PageView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: urls.length,
                                    controller: pageController,
                                    onPageChanged: (index) {
                                      setState(() {
                                        indexSelecionado = index;
                                      });
                                    },
                                    itemBuilder:
                                        (BuildContext context, int itemIndex) {
                                      return Image.network(
                                        urls[itemIndex],
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 190,
                                right: 190,
                                child: Row(
                                  children: [
                                    ...List.generate(
                                        2,
                                        (index) => Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 2),
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                  color:
                                                      indexSelecionado == index
                                                          ? Colors.pink
                                                          : Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ))
                                  ],
                                ),
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
                                    child: const Icon(
                                        Icons.arrow_back_ios_rounded),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Utils.descricaoAreaAtuacao(trail.occupation!),
                              style: const TextStyle(
                                  color: ColorPallete.labelColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(trail.name!,
                                style: const TextStyle(
                                    color: ColorPallete.secondColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800)),
                            Text(trail.description!,
                                style: const TextStyle(
                                  color: ColorPallete.labelColor,
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () async {
                                if (!mounted) return;

                                commentController.comment.trail_id = widget.id;

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
                                          color: Color.fromARGB(47, 49, 49, 49),
                                          blurRadius: 5,
                                          offset: Offset(2, 2))
                                    ],
                                    color: ColorPallete.bgItemColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.comment_rounded,
                                      size: 30,
                                      color: ColorPallete.secondColor,
                                    ),
                                    Text(
                                      "${trail.comentarios}",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: ColorPallete.secondColor,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Visibility(
                                visible: controller.isProfile(trail.user!.id!),
                                child: InkWell(
                                  onTap: () async {
                                    return showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text(
                                              "Ajustes",
                                              style: TextStyle(
                                                  color:
                                                      ColorPallete.labelColor,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            content: SizedBox(
                                              height: 50,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  InkWell(
                                                    onTap: () async {
                                                      bool excluido =
                                                          await controller
                                                              .excluirTrilha(
                                                                  widget.id);

                                                      if (excluido) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                const SnackBar(
                                                                    content: Text(
                                                                        "Trilha excluída com sucesso!")));
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
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: ColorPallete
                                                                .primaryColor),
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
                        ),
                      ),
                    ],
                  );
                }

                return Container();
              }),
        ),
      ),
    );
  }
}
