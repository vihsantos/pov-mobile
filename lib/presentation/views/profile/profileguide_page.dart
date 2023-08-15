import 'package:flutter/material.dart';
import 'components/profile_header.dart';

class ProfileGuidePage extends StatefulWidget {
  const ProfileGuidePage({super.key});

  @override
  State<ProfileGuidePage> createState() => _ProfileGuidePageState();
}

class _ProfileGuidePageState extends State<ProfileGuidePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(children: [
            const ProfileHeader(),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10)),
                ),
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
