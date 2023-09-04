// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'components/profile_header.dart';
import 'components/trilhasbutton.dart';

class ProfileGuidePage extends StatefulWidget {
  final int id;

  const ProfileGuidePage({
    Key? key,
    required this.id,
  }) : super(key: key);

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
          child: Column(children: [
            ProfileHeader(),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          ]),
        ),
      ),
    );
  }
}

