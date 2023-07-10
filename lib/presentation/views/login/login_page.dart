import 'package:flutter/material.dart';

import '../../widgets/input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              Image.asset(
                "asset/img/logo__pov.png",
                width: 250,
              ),
              const InputField(
                  label: 'Email',
                  child: TextField(
                    decoration: InputDecoration(
                        hintStyle: TextStyle(fontStyle: FontStyle.italic),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Digite seu email"),
                  )),
              const InputField(
                  label: 'Senha',
                  child: TextField(
                    decoration: InputDecoration(
                        hintStyle: TextStyle(fontStyle: FontStyle.italic),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Digite sua senha"),
                  )),
              InkWell(
                onTap: null,
                child: Container(
                  margin: EdgeInsets.all(15),
                  width: size.width,
                  height: 65,
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
    );
  }
}
