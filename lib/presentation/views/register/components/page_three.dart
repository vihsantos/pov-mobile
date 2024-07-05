import 'package:flutter/material.dart';
import 'package:pov/presentation/controllers/registerpage_controller.dart';
import 'package:pov/presentation/widgets/input_field.dart';
import 'package:pov/services/core/colorpallete.dart';

class PageThree extends StatefulWidget {
  const PageThree({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final RegisterPageController controller;

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  IconData passwordIcon = Icons.visibility_off;
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Dados do Usuário",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: ColorPallete.primaryColor),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: size.width,
          height: size.height * 0.64,
          child: Column(
            children: [
              InputField(
                label: 'Username',
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 10, bottom: 10),
                  child: TextField(
                    onChanged: (value) =>
                        widget.controller.usuario.username = value,
                    decoration: const InputDecoration(
                        hintStyle: TextStyle(
                            fontStyle: FontStyle.normal,
                            color: ColorPallete.labelColor),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Digite seu nome de usuário"),
                  ),
                ),
              ),
              InputField(
                label: 'Senha',
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 10, bottom: 10),
                  child: TextField(
                    obscureText: isObscure,
                    onChanged: (value) =>
                        widget.controller.usuario.password = value,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isObscure = !isObscure;

                                if (isObscure) {
                                  passwordIcon = Icons.visibility_off;
                                } else {
                                  passwordIcon = Icons.visibility;
                                }
                              });
                            },
                            icon: Icon(passwordIcon)),
                        hintStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            color: ColorPallete.labelColor),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Digite sua senha"),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  var dados = widget.controller.usuario;

                        bool dadosNaoPreenchidos = dados.username == null ||
                            dados.password == null;

                        if (dadosNaoPreenchidos) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  title: Text(
                                    "Você precisa preencher todos os dados da tela para seguir para cadastrar o usuário.",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: ColorPallete.labelColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              });
                          return;
                        }

                  bool cadastrado = await widget.controller.cadastrarUsuario();

                  if(cadastrado){
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Usuário cadastrado com sucesso!")));
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pop();
                  } else {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Não foi possível cadastrar usuário!")));
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pop();
                  }
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
                          end: Alignment.bottomLeft,
                          colors: [
                            Color.fromARGB(255, 112, 232, 96),
                            Color.fromARGB(255, 180, 232, 97)
                          ])),
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
        )
      ],
    );
  }
}
