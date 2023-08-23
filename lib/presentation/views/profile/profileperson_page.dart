import 'package:flutter/material.dart';
import 'package:pov/presentation/controllers/profilepage_controller.dart';
import 'package:pov/presentation/views/profile/components/profile_header.dart';
import 'package:pov/repository/post_repository.dart';

import '../../widgets/bottom_navigation.dart';
import 'components/card_postprofile.dart';

class ProfilePersonPage extends StatefulWidget {
  const ProfilePersonPage({super.key});

  @override
  State<ProfilePersonPage> createState() => _ProfilePersonPageState();
}

class _ProfilePersonPageState extends State<ProfilePersonPage> {
  ProfilePageController controller = ProfilePageController(PostRepository());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: const BottomNavigation(),
        body: Column(
          children: [
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ProfileHeader(),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: ValueListenableBuilder<bool>(
                    valueListenable: controller.loadingApi,
                    builder: (_, bool loading, __) {
                      if (loading) {
                        return const CircularProgressIndicator();
                      }

                      if (controller.error != null) {
                        return const Text("Ocorreu um erro!!");
                      }

                      if (controller.posts!.isEmpty) {
                        return Container();
                      }

                      return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200, mainAxisSpacing: 10),
                          itemCount: controller.posts?.length,
                          itemBuilder: (BuildContext context, index) {
                            return CardPostProfile(
                              post: controller.posts![index],
                            );
                          });
                    }))
          ],
        ),
      ),
    );
  }
}
