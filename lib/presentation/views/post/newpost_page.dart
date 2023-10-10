import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pov/presentation/controllers/newpostpage_controller.dart';
import 'package:pov/repository/post_repository.dart';

import '../../widgets/input_field.dart';
import '../../widgets/search.dart';

class NewPostPage extends StatefulWidget {
  const NewPostPage({super.key});

  @override
  State<NewPostPage> createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  NewPostPageController controller =
      NewPostPageController(repository: PostRepository());
  int value = 0;

  List<File> files = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 15, bottom: 10),
                child: InkWell(
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
                      files = filePickerResult.paths
                          .map((path) => File(path!))
                          .toList();
                    });
                  },
                  child: Container(
                      width: size.width,
                      height: 450,
                      decoration: BoxDecoration(
                          color: const Color(0xFFF6F6FC),
                          borderRadius: BorderRadius.circular(10)),
                      child: files.isEmpty
                          ? const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.panorama,
                                  size: 128,
                                  color: Colors.grey,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Text(
                                    "Toque aqui para selecionar a foto do seu post",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 18),
                                  ),
                                )
                              ],
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                files[0],
                                fit: BoxFit.cover,
                              ),
                            )),
                ),
              ),
              InputField(
                label: 'Localização',
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Search(
                                  controller: controller,
                                )));
                  },
                  child: const Text("Search"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Legenda: ",
                      style: TextStyle(
                          color: Color(0xFF393434),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      width: 400,
                      height: 120,
                      decoration: BoxDecoration(
                          color: const Color(0xFFF6F6FC),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextFormField(
                          onChanged: (value) =>
                              controller.novoPost.description = value,
                          maxLines: 5,
                          decoration: const InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText:
                                  "Descreva a sua experiência com este lugar"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Avaliação: ",
                      style: TextStyle(
                          color: Color(0xFF393434),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (value <= 0) {
                            return;
                          }
                          value = value - 1;
                        });
                      },
                      child: Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: const Color(0xFFF6F6FC)),
                          child: const Icon(Icons.remove)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      value.toString(),
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.star,
                      size: 26,
                      color: Colors.pink,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (value > 4) {
                            return;
                          }
                          value = value + 1;
                        });
                      },
                      child: Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: const Color(0xFFF6F6FC)),
                          child: const Icon(Icons.add)),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  controller.novoPost.stars = value;
                  bool enviou = await controller.enviarImagem(files[0]) as bool;
                  if (!mounted) return;

                  if (enviou) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Post salvo com sucesso!")));
                    Navigator.of(context).pop();
                  }
                  //controller.criarPost();
                },
                child: Container(
                  margin: const EdgeInsets.all(15),
                  width: size.width,
                  height: 60,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 4,
                            color: Color.fromARGB(55, 116, 116, 116))
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFFE86060), Color(0xFFE86192)])),
                  child: const Center(
                      child: Text(
                    "Salvar",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
