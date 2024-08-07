import 'package:flutter/material.dart';

class ButtonSalvar extends StatelessWidget {
  const ButtonSalvar({
    super.key,
    required this.onTap
  });

  final Function() onTap;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
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
    );
  }
}
