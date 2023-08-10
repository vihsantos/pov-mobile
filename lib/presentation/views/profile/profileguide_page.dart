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
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(children: [ProfileHeader()]),
        ),
      ),
    );
  }
}
