import 'package:flutter/material.dart';
import 'package:pov/presentation/views/home/home_page.dart';

import '../../../models/login/login_model.dart';
import '../../../repository/login_repository.dart';
import '../../controllers/loginpage_controller.dart';
import '../../widgets/input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginPageController controller = LoginPageController(
    loginRepository: LoginRepository(),
  );

  var txtUser = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 120,
                ),
                Image.asset(
                  "asset/img/testelogo.png",
                  width: 250,
                ),
                const SizedBox(
                  height: 40,
                ),
                InputField(
                    label: 'Email',
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: TextField(
                        controller: txtUser,
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(fontStyle: FontStyle.italic),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "Digite seu email"),
                      ),
                    )),
                InputField(
                    label: 'Senha',
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: TextField(
                        controller: txtSenha,
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(fontStyle: FontStyle.italic),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "Digite sua senha"),
                      ),
                    )),
                InkWell(
                  onTap: () {
                    LoginModel model = LoginModel();
                    model.username = txtUser.text;
                    model.password = txtSenha.text;
                    controller.logar(model);
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
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFFE86060), Color(0xFFE86192)])),
                    child: const Center(
                        child: Text(
                      "Entrar",
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
      ),
    );
  }
}
