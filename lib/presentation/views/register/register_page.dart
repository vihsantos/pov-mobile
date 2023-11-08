import 'package:flutter/material.dart';
import 'package:pov/presentation/controllers/registerpage_controller.dart';
import 'package:pov/repository/user_repository.dart';
import '../../../models/enums/AreaAtuacao.dart';
import '../../widgets/input_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterPageController registerController =
      RegisterPageController(repository: UserRepository());

  bool isGuide = false;

  Set<AreaAtuacao> filters = <AreaAtuacao>{};

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
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Image.asset(
                  "asset/img/testelogo.png",
                  height: size.height * 0.12,
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
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
              const SizedBox(height: 10),
              SizedBox(
                width: size.width,
                height: size.height * 0.65,
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
                        InputField(
                          label: 'Nome',
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 10, bottom: 10),
                            child: TextField(
                              onChanged: (value) =>
                                  registerController.usuario.nome = value,
                              decoration: const InputDecoration(
                                  hintStyle:
                                      TextStyle(fontStyle: FontStyle.italic),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "Digite seu nome"),
                            ),
                          ),
                        ),
                        InputField(
                          label: 'Email',
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 10, bottom: 10),
                            child: TextField(
                              onChanged: (value) =>
                                  registerController.usuario.email = value,
                              decoration: const InputDecoration(
                                  hintStyle:
                                      TextStyle(fontStyle: FontStyle.italic),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "Digite seu email"),
                            ),
                          ),
                        ),
                        InputField(
                          label: 'Data de Nascimento',
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 10, bottom: 10),
                            child: TextField(
                              onTap: () async {
                                DateTime? date = await showDatePicker(
                                    context: context,
                                    initialDate:
                                        DateTime(DateTime.now().year - 18),
                                    firstDate:
                                        DateTime(DateTime.now().year - 99),
                                    lastDate:
                                        DateTime(DateTime.now().year - 13));

                                if (date != null) {
                                  registerController.usuario.data_nascimento =
                                      date;
                                }
                              },
                              decoration: InputDecoration(
                                  hintStyle: const TextStyle(
                                      fontStyle: FontStyle.italic),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: registerController
                                              .usuario.data_nascimento ==
                                          null
                                      ? "Informe a data de nascimento"
                                      : registerController
                                          .usuario.data_nascimento
                                          .toString()),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 15, right: 15, top: 10, bottom: 10),
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
                                  groupValue: registerController.usuario.guide,
                                  title: const Text("Não"),
                                  onChanged: (value) {
                                    setState(() {
                                      registerController.usuario.guide =
                                          value as bool;
                                      isGuide = value;
                                    });
                                  }),
                            ),
                            Expanded(
                              child: RadioListTile(
                                  value: true,
                                  groupValue: registerController.usuario.guide,
                                  title: const Text("Sim"),
                                  onChanged: (value) {
                                    setState(() {
                                      registerController.usuario.guide =
                                          value as bool;
                                      isGuide = value;
                                    });
                                  }),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            if (!isGuide) {
                              controller.jumpToPage(3);
                              return;
                            }

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
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(children: [
                        InputField(
                          label: 'Numero do Cadastur',
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 10, bottom: 10),
                            child: TextField(
                              onChanged: (value) =>
                                  registerController.usuario.cadastur = value,
                              decoration: const InputDecoration(
                                  hintStyle:
                                      TextStyle(fontStyle: FontStyle.italic),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "Digite o numero do Cadastur"),
                            ),
                          ),
                        ),
                        InputField(
                          label: "Área de Atuação",
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Wrap(
                              spacing: 5.0,
                              children:
                                  AreaAtuacao.values.map((AreaAtuacao area) {
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
                        ),
                        InputField(
                          label: 'Data de Vencimento',
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 10, bottom: 10),
                            child: TextField(
                              onTap: () async {
                                DateTime? date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate:
                                        DateTime(DateTime.now().year + 10));

                                if (date != null) {
                                  setState(() {
                                    registerController.usuario.data_vencimento =
                                        date;
                                  });
                                }
                              },
                              decoration: InputDecoration(
                                  hintStyle: const TextStyle(
                                      fontStyle: FontStyle.italic),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: registerController
                                              .usuario.data_vencimento ==
                                          null
                                      ? "Digite a data de Vencimento do Cadastur"
                                      : registerController
                                          .usuario.data_vencimento
                                          .toString()),
                            ),
                          ),
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
                      ]),
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        InputField(
                          label: 'Username',
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 10, bottom: 10),
                            child: TextField(
                              onChanged: (value) =>
                                  registerController.usuario.username = value,
                              decoration: const InputDecoration(
                                  hintStyle:
                                      TextStyle(fontStyle: FontStyle.italic),
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
                              onChanged: (value) =>
                                  registerController.usuario.password = value,
                              decoration: const InputDecoration(
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
                            padding: EdgeInsets.only(
                                left: 15, right: 15, top: 10, bottom: 10),
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
                            if (filters.isNotEmpty) {
                              String dados = "";

                              for (var area in filters) {
                                dados += "${area.id}; ";
                              }

                              registerController.usuario.areatuacao = dados;
                            }

                            registerController.cadastrarUsuario();
                            Navigator.pop(context);
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
