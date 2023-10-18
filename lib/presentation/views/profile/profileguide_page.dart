// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pov/dto/dadosperfil_dto.dart';
import '../../../models/post/postprofile_model.dart';
import '../../controllers/profilepage_controller.dart';
import 'components/card_postprofile.dart';
import 'components/profile_header.dart';
import 'components/trilhasbutton.dart';

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
        body: Column(children: [
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: FutureBuilder<DadosPerfilDTO?>(
              future: widget.controller.dadosPerfil(widget.id),
              builder: (context, snapshot) {
                DadosPerfilDTO? dados = snapshot.data;
                if (snapshot.hasError) {
                  return const Text("Houve um erro!");
                }

                if (dados == null) {
                  return Container();
                }

                return ProfileHeader(dados: dados, isprofileuser: false);
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TrilhasButton(),
                SizedBox(
                  width: 280,
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cadastur",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      Text("1234565"),
                      Text("Área de Atuação",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                      Text("dajksjkdjkjkjk"),
                    ],
                  ),
                )
              ],
            ),
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
