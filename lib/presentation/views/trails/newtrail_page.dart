import 'package:flutter/material.dart';

import '../../widgets/input_field.dart';

class NewTrailPage extends StatefulWidget {
  const NewTrailPage({super.key});

  @override
  State<NewTrailPage> createState() => _NewTrailPageState();
}

class _NewTrailPageState extends State<NewTrailPage> {
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
        body: Column(
          children: [
            const InputField(
                label: "Nome da Trilha",
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        hintStyle: TextStyle(fontStyle: FontStyle.italic),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Digite o nome da trilha"),
                  ),
                )),
            InputField(
                label: "Adicione imagens dessa trilha", child: Container()),
            InputField(label: "Área de Atuação", child: Container()),
            InputField(label: "Descrição", child: Container()),
          ],
        ),
      ),
    );
  }
}
