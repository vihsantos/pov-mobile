import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pov/models/enums/AreaAtuacao.dart';
import '../../controllers/newtrailpage_controller.dart';
import '../../widgets/input_field.dart';

class NewTrailPage extends StatefulWidget {
  const NewTrailPage({super.key});

  @override
  State<NewTrailPage> createState() => _NewTrailPageState();
}

class _NewTrailPageState extends State<NewTrailPage> {
  NewTrailPageController controller = NewTrailPageController();

  Set<AreaAtuacao> filters = <AreaAtuacao>{};

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Adicione imagens dessa trilha!",
                          maxLines: 2,
                          style: TextStyle(
                              color: Color(0xFF393434),
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Toque no botão ao lado",
                          maxLines: 2,
                          style: TextStyle(
                              color: Color(0xFF393434),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
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
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 15, top: 15),
                width: size.width,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: const Color(0xFFF6F6FC),
                    borderRadius: BorderRadius.circular(10)),
                child: ValueListenableBuilder<List<File>>(
                    valueListenable: controller.filesNotifier,
                    builder: (__, files, _) {
                      if (files.isEmpty) {
                        return const Text("Sem arquivos para exibir");
                      }

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
                                width: 100,
                                height: 100,
                              ),
                            );
                          },
                        ),
                      );
                    }),
              ),
              InputField(
                label: "Área de Atuação",
                child: Wrap(
                  spacing: 5.0,
                  children: AreaAtuacao.values.map((AreaAtuacao area) {
                    return FilterChip(
                      label: Text(
                        area.descricao,
                        maxLines: 2,
                      ),
                      selected: filters.contains(area),
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            filters.add(area);
                          } else {
                            filters.remove(area);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              InputField(
                  label: "Descrição",
                  child: Container(
                    width: 400,
                    height: 120,
                    decoration: BoxDecoration(
                        color: const Color(0xFFF6F6FC),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: TextFormField(
                        maxLines: 5,
                        decoration: const InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText:
                                "Descreva as atividades presentes nesse pacote!"),
                      ),
                    ),
                  )),
              InkWell(
                onTap: () async {},
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
