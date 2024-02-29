// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pov/dto/dadosperfil_dto.dart';
import 'package:pov/presentation/controllers/profilepage_controller.dart';
import 'package:pov/repository/post_repository.dart';
import 'package:pov/repository/user_repository.dart';
import 'package:pov/services/core/colorpallete.dart';

class ProfileHeader extends StatefulWidget {
  final int user_id;
  final bool isprofileuser;
  final DadosPerfilDTO dados;

  const ProfileHeader(
      {Key? key,
      required this.isprofileuser,
      required this.dados,
      required this.user_id})
      : super(key: key);

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ProfilePageController controller = ProfilePageController(postRepository: PostRepository(), userRepository: UserRepository());

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width * 0.28,
          height: size.height * 0.08,
          child: Column(
            children: [
              Text(
                widget.dados.following!.length.toString(),
                style: const TextStyle(fontSize: 22),
              ),
              const Text("Seguindo",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16))
            ],
          ),
        ),
        Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(75),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  child: InkWell(
                    onTap: () async {
                      return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Troque sua foto de perfil!"),
                              content: SizedBox(
                                height: 200,
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        final filePickerResult =
                                            await FilePicker.platform.pickFiles(
                                                allowMultiple: false,
                                                type: FileType.custom,
                                                allowedExtensions: [
                                              'png',
                                              'jpeg',
                                            ]);

                                        if (filePickerResult == null) return;

                                        setState(() {
                                          // ignore: unused_local_variable
                                          var files = filePickerResult.paths
                                              .map((path) => File(path!))
                                              .toList();
                                        });
                                      },
                                      child: const Text(
                                          "Clique aqui e escolha a foto"),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: 150,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: ColorPallete.bgItemColor,
                                      ),
                                      child: const Icon(
                                        Icons.burst_mode_rounded,
                                        size: 64,
                                        color:
                                            ColorPallete.bottomUnselectedColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text("Ok"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: ColorPallete.bgItemColor,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                color: const Color.fromARGB(45, 57, 52, 52),
                                width: 0.5)),
                        child: const Icon(
                          Icons.edit,
                          color: ColorPallete.primaryColor,
                        )),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Text(
              widget.dados.username!,
              style: const TextStyle(
                  color: Color(0xFF393434),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Visibility(
              visible: !widget.isprofileuser,
              child: InkWell(
                onTap: () {
                  if (controller.isFollower!) {
                    return;
                  }
                },
                child: Container(
                  width: size.width * 0.35,
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                      color: !controller.isFollower!
                          ? ColorPallete.primaryColor
                          : ColorPallete.bottomUnselectedColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    !controller.isFollower! ? "Seguir" : "Deixar de seguir",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  )),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          width: size.width * 0.28,
          height: size.height * 0.08,
          child: Column(
            children: [
              Text(
                widget.dados.followers!.length.toString(),
                style: const TextStyle(fontSize: 22),
              ),
              const Text("Seguidores",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16))
            ],
          ),
        ),
      ],
    );
  }
}
