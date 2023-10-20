import 'package:flutter/material.dart';
import 'package:pov/models/post/postprofile_model.dart';
import 'package:pov/presentation/controllers/profilepage_controller.dart';
import 'package:pov/presentation/views/profile/components/profile_header.dart';
import '../../../dto/dadosperfil_dto.dart';
import '../../widgets/bottom_navigation.dart';
import 'components/card_postprofile.dart';

class ProfilePersonPage extends StatefulWidget {
  final int id;
  final ProfilePageController controller;
  const ProfilePersonPage(
      {super.key, required this.id, required this.controller});

  @override
  State<ProfilePersonPage> createState() => _ProfilePersonPageState();
}

class _ProfilePersonPageState extends State<ProfilePersonPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: const BottomNavigation(),
        body: Column(
          children: [
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

                  return ProfileHeader(dados: dados, isprofileuser: widget.controller.isProfile(widget.id));
                },
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
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
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
          ],
        ),
      ),
    );
  }
}
