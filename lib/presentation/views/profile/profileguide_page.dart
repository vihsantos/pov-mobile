// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pov/dto/dadosperfil_dto.dart';
import 'package:pov/presentation/views/trails/newtrail_page.dart';
import 'package:pov/services/core/colorpallete.dart';

import '../../../models/post/postprofile_model.dart';
import '../../controllers/profilepage_controller.dart';
import '../trails/trails_page.dart';
import 'components/card_postprofile.dart';
import 'components/profile_header.dart';

class ProfileGuidePage extends StatefulWidget {
  final int id;
  final ProfilePageController controller;

  const ProfileGuidePage({
    Key? key,
    required this.id,
    required this.controller,
  }) : super(key: key);

  @override
  State<ProfileGuidePage> createState() => _ProfileGuidePageState();
}

class _ProfileGuidePageState extends State<ProfileGuidePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Perfil",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Informações sobre o guia", 
                          textAlign: TextAlign.center, 
                          style: TextStyle(
                            color: ColorPallete.labelColor,
                            fontWeight: FontWeight.bold, 
                            fontSize: 18)),
                          content: SizedBox(
                            width: 400,
                            height: 250,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CampoTitulo(titulo: "CADASTUR"),
                                const Text("XXXXXXXXXXXX", 
                                style: TextStyle(fontSize: 14, color: ColorPallete.labelColor)),
                                const SizedBox(height: 10),
                                CampoTitulo(titulo: "Vencimento do CADASTUR"),
                                const Text("DD/MM/AAAA", 
                                style: TextStyle(fontSize: 14, color: ColorPallete.labelColor)),
                                const SizedBox(height: 10),
                                CampoTitulo(titulo: "Áreas de Atuação"),
                                const Text("teste teste teste teste teste teste teste teste",
                                maxLines: 3, 
                                style: TextStyle(fontSize: 14, color: ColorPallete.labelColor)),
                                const SizedBox(height: 10),
                                CampoTitulo(titulo: "Contato"),
                                const Text("email", 
                                style: TextStyle(fontSize: 14, color: ColorPallete.labelColor)),
                              ],
                            ),
                          ),
                        );
                      });
                },
                icon: const Icon(Icons.info, color: ColorPallete.secondColor)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TrailsPage(
                                id: widget.id,
                              )));
                },
                icon: const Icon(Icons.location_on,
                    color: ColorPallete.secondColor)),
            Visibility(
              visible: widget.controller.isProfile(widget.id),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewTrailPage()));
                  },
                  icon: const Icon(
                    Icons.add_location_alt,
                    color: ColorPallete.secondColor,
                  )),
            )
          ],
        ),
        body: Column(children: [
          const SizedBox(height: 15),
          FutureBuilder<DadosPerfilDTO?>(
            future: widget.controller.dadosPerfil(widget.id),
            builder: (context, snapshot) {
              DadosPerfilDTO? dados = snapshot.data;
              if (snapshot.hasError) {
                return const Text("Houve um erro!");
              }

              if (dados == null) {
                return Container();
              }

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    ProfileHeader(
                      dados: dados,
                      isprofileuser: widget.controller.isProfile(widget.id),
                      user_id: widget.id,
                      profilePageController: widget.controller,
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: FutureBuilder<List<PostProfileModel>?>(
            future: widget.controller.listarPosts(widget.id),
            builder: (context, snapshot) {
              List<PostProfileModel>? posts = snapshot.data;
              if (snapshot.hasError) {
                return const Text("Houve um erro!");
              }

              if (posts == null) {
                return Container();
              }

              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      childAspectRatio: 1 / 1,
                      maxCrossAxisExtent: 300,
                      mainAxisSpacing: 0),
                  itemCount: widget.controller.posts?.length,
                  itemBuilder: (BuildContext context, index) {
                    return CardPostProfile(
                      post: widget.controller.posts![index],
                    );
                  });
            },
          )),
        ]),
      ),
    );
  }
}

class CampoTitulo extends StatelessWidget {

  String titulo;

  CampoTitulo({
    Key? key,
    required this.titulo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(titulo, 
    style: const TextStyle(
      color: ColorPallete.labelColor,
      fontWeight: FontWeight.bold, 
      fontSize: 13));
  }
}
