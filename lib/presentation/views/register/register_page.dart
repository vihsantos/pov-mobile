import 'package:flutter/material.dart';

import '../../widgets/input_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Cadastro",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
          ),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              InputField(
                label: 'Nome',
                child: TextField(
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontStyle: FontStyle.italic),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Digite seu nome"),
                ),
              ),
              InputField(
                label: 'Email',
                child: TextField(
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontStyle: FontStyle.italic),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Digite seu email"),
                ),
              ),
              InputField(
                label: 'Nome de usuário',
                child: TextField(
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontStyle: FontStyle.italic),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Digite um nome de usuário"),
                ),
              ),
              InputField(
                label: 'Data de nascimento',
                child: TextField(
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontStyle: FontStyle.italic),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Digite sua data de nascimento"),
                ),
              ),
              InputField(
                label: 'Senha',
                child: TextField(
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontStyle: FontStyle.italic),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Digite uma senha"),
                ),
              ),
              InputField(
                label: 'Confirme sua senha',
                child: TextField(
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontStyle: FontStyle.italic),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Confirme sua senha"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
