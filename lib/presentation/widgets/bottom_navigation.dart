import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Container(
      width: size.width,
      height: size.height * 0.075,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: const Color(0xFFF8F8F8),
          borderRadius: BorderRadius.circular(10)),
      child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ItemBottom(
              icon: Icons.dashboard,
              text: 'Home',
              selecionado: true,
            ),
            ItemBottom(
              icon: Icons.person_search,
              text: 'Guias',
              selecionado: false,
            ),
            ItemBottom(icon: Icons.add, text: "Novo Post", selecionado: false),
            ItemBottom(
              icon: Icons.groups,
              text: 'Grupos',
              selecionado: false,
            ),
            ItemBottom(
              icon: Icons.account_circle,
              text: 'Perfil',
              selecionado: false,
            )
          ]),
    ));
  }
}

class ItemBottom extends StatelessWidget {
  const ItemBottom({
    super.key,
    required this.icon,
    required this.text,
    required this.selecionado,
  });

  final IconData icon;
  final String text;
  final bool selecionado;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 36,
            color:
                selecionado ? const Color(0xFF6461E8) : const Color(0xFFC0C0C0),
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w900,
                color: selecionado
                    ? const Color(0xFF6461E8)
                    : const Color(0xFFC0C0C0)),
          ),
        ],
      ),
    );
  }
}
