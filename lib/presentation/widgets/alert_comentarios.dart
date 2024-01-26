// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pov/models/comment_model.dart';
import 'package:pov/presentation/widgets/comment_container.dart';
import '../../services/core/colorpallete.dart';
import '../controllers/commentpage_controller.dart';

class AlertComentarios extends StatefulWidget {
  final CommentPageController controller;

  const AlertComentarios({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<AlertComentarios> createState() => _AlertComentariosState();
}

class _AlertComentariosState extends State<AlertComentarios> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Comentários",
                  style: TextStyle(
                      fontSize: 20,
                      color: ColorPallete.labelColor,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                      width: size.width,
                      height: size.height * 0.35,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: FutureBuilder<List<CommentModel?>?>(
                              future: widget.controller.listarComentarios(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  List<CommentModel?>? comentarios =
                                      snapshot.data;

                                  if (comentarios!.isEmpty) {
                                    return Container();
                                  }

                                  if (widget.controller.error != null) {
                                    return Text(
                                        widget.controller.error!.mensagem);
                                  }

                                  return Column(
                                    children: [
                                      ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemCount: comentarios.length,
                                          itemBuilder: (_, index) {
                                            final comentario =
                                                comentarios[index];

                                            return CommentContainer(
                                                comentario: comentario!);
                                          })
                                    ],
                                  );
                                }

                                if (snapshot.hasError) {
                                  return const Text("ERROR");
                                }

                                return Container();
                              }))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    width: size.width,
                    height: 100,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 198, 198, 226),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Container(
                          width: size.width * 0.75,
                          height: 100,
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10))),
                          child: TextField(
                            maxLength: 500,
                            maxLines: 3,
                            onChanged: (value) =>
                                widget.controller.comment.description = value,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Escreva um comentário",
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () async {
                              bool enviou = await widget.controller.criarNovoComentario();

                              if (!mounted) return;

                              if (enviou) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("Comentário enviado com sucesso!")));
                                Navigator.of(context).pop();
                              }
                            },
                            icon: const Icon(
                              Icons.send,
                              color: ColorPallete.primaryColor,
                            ))
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
