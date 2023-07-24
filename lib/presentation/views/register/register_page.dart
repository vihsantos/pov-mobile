import 'package:flutter/material.dart';

import '../../widgets/input_field.dart';
import '../home/home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isGuide = false;

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Image.asset(
                  "asset/img/testelogo.png",
                  height: 80,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                child: Text(
                  "Crie a sua conta",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF393434)),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "Que bom que deseja fazer parte da nossa rede!",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                      color: Color(0xFF393434)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: size.width,
                height: size.height * 0.6,
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const InputField(
                          label: 'Nome',
                          child: Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintStyle:
                                      TextStyle(fontStyle: FontStyle.italic),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "Digite seu nome"),
                            ),
                          ),
                        ),
                        const InputField(
                          label: 'Email',
                          child: Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintStyle:
                                      TextStyle(fontStyle: FontStyle.italic),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "Digite seu email"),
                            ),
                          ),
                        ),
                        const InputField(
                          label: 'Data de Nascimento',
                          child: Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintStyle:
                                      TextStyle(fontStyle: FontStyle.italic),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "Informe a data de nascimento"),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15),
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
                                  groupValue: isGuide,
                                  title: const Text("Não"),
                                  onChanged: (value) {
                                    setState(() {
                                      isGuide = value as bool;
                                    });
                                  }),
                            ),
                            Expanded(
                              child: RadioListTile(
                                  value: true,
                                  groupValue: isGuide,
                                  title: const Text("Sim"),
                                  onChanged: (value) {
                                    setState(() {
                                      isGuide = value as bool;
                                    });
                                  }),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            controller.nextPage(
                                duration: const Duration(seconds: 2),
                                curve: Curves.ease);
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color.fromARGB(255, 105, 96, 232),
                                      Color.fromARGB(255, 97, 232, 214)
                                    ])),
                            child: const Center(
                                child: Text(
                              "Próximo",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            )),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const InputField(
                          label: 'Username',
                          child: Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintStyle:
                                      TextStyle(fontStyle: FontStyle.italic),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "Digite seu nome de usuário"),
                            ),
                          ),
                        ),
                        const InputField(
                          label: 'Senha',
                          child: Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintStyle:
                                      TextStyle(fontStyle: FontStyle.italic),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "Digite sua senha"),
                            ),
                          ),
                        ),
                        const InputField(
                          label: 'Confirme sua senha',
                          child: Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintStyle:
                                      TextStyle(fontStyle: FontStyle.italic),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "Confirme a senha escolhida"),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
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
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
