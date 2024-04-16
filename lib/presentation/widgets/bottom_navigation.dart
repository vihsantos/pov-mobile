// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import 'package:pov/repository/login_repository.dart';
import 'package:pov/services/core/colorpallete.dart';
import 'package:pov/services/singleton/auth_singleton.dart';

import '../views/guides/guides_page.dart';
import '../views/home/home_page.dart';
import '../views/profile/profile_page.dart';
import '../views/ranking/ranking_page.dart';

class BottomNavigation extends StatefulWidget {
  int itemSelecionado;
  Function trocaIndex;

  BottomNavigation({
    Key? key,
    required this.itemSelecionado,
    required this.trocaIndex,
  }) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  List pages = [
    const HomePage(),
    const GuidesPage(),
    const RankingPage(),
    ProfilePage(
        id: AuthSingleton(LoginRepository()).getId()!,
        isGuide: AuthSingleton(LoginRepository()).getGuide()!)
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Container(
      width: size.width,
      height: size.height * 0.085,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: ColorPallete.bgItemColor,
          borderRadius: BorderRadius.circular(10)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        ...List.generate(
            itensButtons.length,
            (index) => GestureDetector(
                onTap: () => widget.trocaIndex,
                child: ItemBottom(
                  icon: itensButtons[index].icon,
                  text: itensButtons[index].text,
                  selecionado: widget.itemSelecionado == index,
                )))
      ]),
    ));
  }

  List<ItemDataButton> itensButtons = [
    ItemDataButton(
      icon: Icons.dashboard,
      text: 'Home',
    ),
    ItemDataButton(
      icon: Icons.person_search,
      text: 'Guias',
    ),
    ItemDataButton(icon: Icons.onetwothree, text: "Ranking"),
    ItemDataButton(
      icon: Icons.account_circle,
      text: 'Perfil',
    )
  ];
}

class ItemDataButton {
  final String text;
  final IconData icon;

  ItemDataButton({required this.text, required this.icon});
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
    return Column(
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
    );
  }
}
