import 'package:flutter/material.dart';
import 'package:pov/presentation/views/home/home_page.dart';
import 'package:pov/services/singleton/auth_singleton.dart';
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
    authSingleton: AuthSingleton(LoginRepository()),
  );

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
                SizedBox(
                  height: size.height * 0.2,
                ),
                Image.asset(
                  "asset/img/testelogo.png",
                  width: size.width * .5,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                InputField(
                    label: 'Nome de Usuário',
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 10, bottom: 10),
                      child: TextField(
                        onChanged: (value) => controller.model.username = value,
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(fontStyle: FontStyle.italic),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "Digite seu nome de usuário"),
                      ),
                    )),
                InputField(
                    label: 'Senha',
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 10, bottom: 10),
                      child: TextField(
                        onChanged: (value) => controller.model.password = value,
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(fontStyle: FontStyle.italic),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "Digite sua senha"),
                      ),
                    )),
                InkWell(
                  onTap: () async {
                    var dado = await controller.logar();
                    if (!mounted) return;

                    if (controller.error != null) {
                      return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Poxa!"),
                              content: const Text(
                                  "Ocorreu um erro ao tentar realizar o login, por favor tente novamente!"),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text("Ok"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          });
                    }

                    if (dado != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
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
