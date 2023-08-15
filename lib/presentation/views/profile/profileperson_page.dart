import 'package:flutter/material.dart';
import 'package:pov/presentation/views/profile/components/profile_header.dart';

import '../../widgets/bottom_navigation.dart';
import 'components/card_postprofile.dart';

class ProfilePersonPage extends StatefulWidget {
  const ProfilePersonPage({super.key});

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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ProfileHeader(),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.count(
                scrollDirection: Axis.vertical,
                shrinkWrap: false,
                padding: const EdgeInsets.all(10),
                crossAxisCount: 2,
                children: const [
                  CardPostProfile(),
                  CardPostProfile(),
                  CardPostProfile(),
                  CardPostProfile(),
                  CardPostProfile()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
