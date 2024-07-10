import 'package:flutter/material.dart';

class HeaderRegister extends StatelessWidget {
  const HeaderRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        Image.asset(
          "asset/img/testelogo.png",
          height: size.height * 0.12,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Crie a sua conta",
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
                color: Color(0xFF393434)),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Que bom que deseja fazer parte da nossa rede!",
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 16,
                color: Color(0xFF393434)),
          ),
        ),
      ],
    );
  }
}
