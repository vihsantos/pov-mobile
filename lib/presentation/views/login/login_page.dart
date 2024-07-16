import 'package:flutter/material.dart';
import 'package:pov/presentation/views/init_page.dart';
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
  IconData passwordIcon = Icons.visibility_off;
  bool isObscure = true;

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
                  "asset/img/pov-logo.png",
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
                        obscureText: isObscure,
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
                            hintStyle:
                                const TextStyle(fontStyle: FontStyle.italic),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "Digite sua senha"),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      const Text("Esqueceu a senha?"),
                      TextButton(
                          onPressed: () async {
                            return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: SizedBox(
                                      height: size.height * .4,
                                      child: const Column(
                                        children: [
                                          Text("Troque sua senha",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold)),
                                          InputField(
                                              label: "Nome de usuário",
                                              child: TextField(
                                                  decoration: InputDecoration(
                                                      hintStyle: TextStyle(
                                                          fontStyle:
                                                              FontStyle.italic),
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                      hintText:
                                                          "Digite seu nome de usuário")))
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: const Text("Clique aqui!"))
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    var dado = await controller.logar();
                    if (!mounted) return;

                    if (controller.error != null) {
                      return showDialog(
                          // ignore: use_build_context_synchronously
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
                          // ignore: use_build_context_synchronously
                          context,
                          MaterialPageRoute(builder: (context) => InitPage()));
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
