import 'package:flutter/material.dart';
import 'package:pov/presentation/controllers/profilepage_controller.dart';
import 'package:pov/presentation/views/profile/profileguide_page.dart';
import 'package:pov/presentation/views/profile/profileperson_page.dart';

import '../../../repository/post_repository.dart';
import '../../../repository/user_repository.dart';

class ProfilePage extends StatefulWidget {
  final int id;
  final bool isGuide;
  const ProfilePage({super.key, required this.isGuide, required this.id});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfilePageController controller = ProfilePageController(
      postRepository: PostRepository(), userRepository: UserRepository());

  @override
  Widget build(BuildContext context) {
    return widget.isGuide
        ? ProfileGuidePage(
            id: widget.id,
            controller: controller,
          )
        : ProfilePersonPage(
            id: widget.id,
            controller: controller,
          );
  }
}
