// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pov/dto/dadosperfil_dto.dart';
import 'package:pov/presentation/controllers/profilepage_controller.dart';
import 'package:pov/services/core/colorpallete.dart';

class ProfileHeader extends StatefulWidget {
  final int user_id;
  final bool isprofileuser;
  final DadosPerfilDTO dados;
  final ProfilePageController profilePageController;

  const ProfileHeader(
      {super.key,
      required this.user_id,
      required this.isprofileuser,
      required this.dados,
      required this.profilePageController});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  void initState() {
    widget.profilePageController.verificarSeguidor(widget.user_id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width * 0.26,
          height: size.height * 0.08,
          child: Column(
            children: [
              Text(
                widget.dados.following!.length.toString(),
                style: const TextStyle(fontSize: 22),
              ),
              const Text("Seguindo",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15))
            ],
          ),
        ),
        Column(
          children: [
            Stack(
              children: [
                widget.dados.profileIcon != null
                    ? SizedBox(
                        width: 130,
                        height: 130,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              widget.dados.profileIcon!,
                              fit: BoxFit.cover,
                            )),
                      )
                    : Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(75),
                        ),
                      ),
                Visibility(
                  visible: widget.isprofileuser,
                  child: Positioned(
                    bottom: 4,
                    child: InkWell(
                      onTap: () async {
                        return changeIconProfile(context);
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
            //o visibility tem que ficar dentro de um value listnable
            ValueListenableBuilder<bool?>(
                valueListenable: widget.profilePageController.loadingApi,
                builder: (_, loading, __) {
                  if (loading!) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return Visibility(
                    visible: !widget.isprofileuser,
                    child: InkWell(
                      onTap: () => widget.profilePageController
                          .seguirOuDeixarDeSeguir(widget.user_id),
                      child: Container(
                        width: size.width * 0.35,
                        height: size.height * 0.06,
                        decoration: BoxDecoration(
                            color: widget.profilePageController.isFollower!
                                ? ColorPallete.bottomUnselectedColor
                                : ColorPallete.primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          widget.profilePageController.isFollower!
                              ? "Deixar de seguir"
                              : "Seguir",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )),
                      ),
                    ),
                  );
                })
          ],
        ),
        SizedBox(
          width: size.width * 0.26,
          height: size.height * 0.08,
          child: Column(
            children: [
              Text(
                widget.dados.followers!.length.toString(),
                style: const TextStyle(fontSize: 22),
              ),
              const Text("Seguidores",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15))
            ],
          ),
        ),
      ],
    );
  }

  Future<void> changeIconProfile(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Troque sua foto de perfil!"),
            content: SizedBox(
              height: 160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      final filePickerResult = await FilePicker.platform
                          .pickFiles(
                              allowMultiple: false,
                              type: FileType.custom,
                              allowedExtensions: [
                            'png',
                            'jpeg',
                          ]);

                      if (filePickerResult == null) return;

                      setState(() {
                        // ignore: unused_local_variable
                        File file = filePickerResult.paths
                            .map((path) => File(path!))
                            .toList()
                            .firstOrNull!;
                        widget.profilePageController.alterarProfileIcon(file);
                      });
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorPallete.bgItemColor,
                      ),
                      child: ValueListenableBuilder<File?>(
                          valueListenable:
                              widget.profilePageController.profileIconApi,
                          builder: (_, file, __) {
                            if (file == null) {
                              return const Icon(
                                Icons.add_a_photo,
                                size: 64,
                                color: ColorPallete.bottomUnselectedColor,
                              );
                            }

                            return Image.file(
                              file,
                              fit: BoxFit.cover,
                            );
                          }),
                    ),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text("Ok"),
                onPressed: () {
                  widget.profilePageController.enviarImagem();
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}