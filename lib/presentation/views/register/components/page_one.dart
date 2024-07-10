import 'package:flutter/material.dart';
import 'package:pov/presentation/controllers/registerpage_controller.dart';
import 'package:pov/presentation/views/register/components/button_next.dart';
import 'package:pov/presentation/widgets/input_field.dart';
import 'package:pov/services/core/colorpallete.dart';
import 'package:pov/services/core/utils.dart';

class PageOne extends StatefulWidget {
  const PageOne({
    Key? key,
    required this.controller,
    required this.onTap,
  }) : super(key: key);

  final RegisterPageController controller;
  final Function() onTap;

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Dados Pessoais",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: ColorPallete.primaryColor),
        ),
        SizedBox(
          width: size.width,
          height: size.height * 0.64,
        child: SingleChildScrollView(
          child: Column(
            children: [
              InputField(
          label: 'Nome',
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            child: TextField(
              onChanged: (value) => widget.controller.usuario.nome = value,
              decoration: const InputDecoration(
                  hintStyle: TextStyle(fontStyle: FontStyle.italic),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "Digite seu nome"),
            ),
          ),
        ),
        InputField(
          label: 'Email',
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            child: TextField(
              onChanged: (value) => widget.controller.usuario.email = value,
              decoration: const InputDecoration(
                  hintStyle: TextStyle(fontStyle: FontStyle.italic),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "Digite seu email"),
            ),
          ),
        ),
        InputField(
          label: 'Data de Nascimento',
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            child: TextField(
              onTap: () async {
                DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: DateTime(DateTime.now().year - 18),
                    firstDate: DateTime(DateTime.now().year - 99),
                    lastDate: DateTime(DateTime.now().year - 13));

                if (date != null) {
                  widget.controller.usuario.data_nascimento = date;
                }
              },
              decoration: InputDecoration(
                  hintStyle: const TextStyle(fontStyle: FontStyle.italic),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: widget.controller.usuario.data_nascimento == null
                      ? "Informe a data de nascimento"
                      : Utils.data(widget.controller.usuario.data_nascimento!)),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
          child: Text(
            "Você é guia turístico?",
            style: TextStyle(
                color: Color(0xFF393434),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: RadioListTile(
                  value: false,
                  groupValue: widget.controller.usuario.guide,
                  title: const Text("Não"),
                  onChanged: (value) {
                    setState(() {
                      widget.controller.usuario.guide = value as bool;
                      widget.controller.isGuide = value;
                    });
                  }),
            ),
            Expanded(
              child: RadioListTile(
                  value: true,
                  groupValue: widget.controller.usuario.guide,
                  title: const Text("Sim"),
                  onChanged: (value) {
                    setState(() {
                      widget.controller.usuario.guide = value as bool;
                      widget.controller.isGuide = value;
                    });
                  }),
            ),
          ],
        ),
        ButtonNext(onTap: widget.onTap)
            ],
          ),
        ),
          )
        
      ],
    );
  }
}