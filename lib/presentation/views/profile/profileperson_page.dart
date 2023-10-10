import 'package:flutter/material.dart';
import 'package:pov/models/post/postprofile_model.dart';
import 'package:pov/presentation/controllers/profilepage_controller.dart';
import 'package:pov/presentation/views/profile/components/profile_header.dart';
import 'package:pov/repository/post_repository.dart';
import 'package:pov/repository/user_repository.dart';

import '../../../dto/dadosperfil_dto.dart';
import '../../widgets/bottom_navigation.dart';
import 'components/card_postprofile.dart';

class ProfilePersonPage extends StatefulWidget {
  final int id;
  const ProfilePersonPage({super.key, required this.id});

  @override
  State<ProfilePersonPage> createState() => _ProfilePersonPageState();
}

class _ProfilePersonPageState extends State<ProfilePersonPage> {
  ProfilePageController controller = ProfilePageController(
      postRepository: PostRepository(), userRepository: UserRepository());

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
                future: controller.dadosPerfil(widget.id),
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
              height: 20,
            ),
            Expanded(
                child: FutureBuilder<List<PostProfileModel>?>(
              future: controller.listarPosts(widget.id),
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
                    itemCount: controller.posts?.length,
                    itemBuilder: (BuildContext context, index) {
                      return CardPostProfile(
                        post: controller.posts![index],
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
