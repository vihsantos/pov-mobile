import 'dart:io';
import 'package:flutter/material.dart';
import '../../controllers/newtrailpage_controller.dart';
import '../../widgets/input_field.dart';

class NewTrailPage extends StatefulWidget {
  const NewTrailPage({super.key});

  @override
  State<NewTrailPage> createState() => _NewTrailPageState();
}

class _NewTrailPageState extends State<NewTrailPage> {
  NewTrailPageController controller = NewTrailPageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Nova Trilha",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const InputField(
                  label: "Nome da Trilha",
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: TextField(
                      decoration: InputDecoration(
                          hintStyle: TextStyle(fontStyle: FontStyle.italic),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: "Digite o nome da trilha"),
                    ),
                  )),
              InputField(
                label: "Adicione imagens dessa trilha",
                child: Column(
                  children: [
                    const Text(
                      "Selecione um até três arquivos",
                      style:
                          TextStyle(
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic, 
                            fontSize: 12),
                    ),
                    InkWell(
                      onTap: () => controller.selecionarArquivos(),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 206, 206, 206),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                            child: Icon(Icons.panorama,
                                color: Color.fromARGB(255, 97, 97, 97))),
                      ),
                    ),
                    ValueListenableBuilder<List<File>>(
                        valueListenable: controller.filesNotifier,
                        builder: (__, files, _) {
                          if (files.isEmpty) {
                            return const Text("Sem arquivos para exibir");
                          }

                          if (files.isNotEmpty) {
                            return SizedBox(
                              height: 150,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: files.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Image.file(
                                      files[index],
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                              ),
                            );
                          }

                          return Container();
                        }),
                  ],
                ),
              ),
              InputField(label: "Área de Atuação", child: Container()),
              InputField(label: "Descrição", child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
