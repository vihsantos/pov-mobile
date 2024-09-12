// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pov/presentation/controllers/registerpage_controller.dart';
import 'package:pov/presentation/views/register/components/header_register.dart';
import 'package:pov/presentation/views/register/components/page_one.dart';
import 'package:pov/presentation/views/register/components/page_three.dart';
import 'package:pov/presentation/views/register/components/page_two.dart';
import 'package:pov/repository/user_repository.dart';
import 'package:pov/services/core/colorpallete.dart';
import '../../../models/enums/AreaAtuacao.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  IconData passwordIcon = Icons.visibility_off;
  bool isObscure = true;

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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HeaderRegister(),
              Container(
                width: size.width,
                height: size.height * 0.69,
                margin: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 235, 235, 235),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller,
                  children: [
                    PageOne(
                      controller: registerController,
                      onTap: () {

                        var dados = registerController.usuario;

                        

                        bool dadosNaoPreenchidos = dados.nome == null ||
                            dados.email == null ||
                            dados.data_nascimento == null ||
                            dados.guide == null;

                        if (dadosNaoPreenchidos) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  title: Text(
                                    "Você precisa preencher todos os dados da tela para seguir para a próxima etapa.",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: ColorPallete.labelColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              });
                          return;
                        }

                        bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(dados.email!);

                        if(!emailValid){
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  title: Text(
                                    "Informe um email válido.",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: ColorPallete.labelColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              });
                          return;
                        }

                        if (!registerController.isGuide) {
                          controller.jumpToPage(3);
                          return;
                        }

                        controller.nextPage(
                            duration: const Duration(seconds: 2),
                            curve: Curves.ease);
                      },
                    ),
                    PageTwo(
                      controller: registerController,
                      onTap: () {
                        var dados = registerController.usuario;

                        bool dadosNaoPreenchidos = dados.estado == null ||
                            dados.municipio == null ||
                            dados.data_vencimento == null;

                        if (dadosNaoPreenchidos) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  title: Text(
                                    "Você precisa preencher todos os dados da tela para seguir para a próxima etapa.",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: ColorPallete.labelColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              });
                          return;
                        }


                        controller.nextPage(
                            duration: const Duration(seconds: 2),
                            curve: Curves.ease);
                      },
                    ),
                    PageThree(
                      controller: registerController,
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
