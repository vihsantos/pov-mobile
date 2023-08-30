import 'package:flutter/material.dart';
import 'package:pov/presentation/views/groups/groups_page.dart';
import 'package:pov/repository/login_repository.dart';
import 'package:pov/services/singleton/auth_singleton.dart';

import '../views/guides/guides_page.dart';
import '../views/home/home_page.dart';
import '../views/post/newpost_page.dart';
import '../views/profile/profile_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int itemSelecionado = 0;

  AuthSingleton auth = AuthSingleton(LoginRepository());

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
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        ...List.generate(
            itensButtons.length,
            (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    itemSelecionado = index;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => pages[itemSelecionado]));
                  });
                },
                child: ItemBottom(
                  icon: itensButtons[index].icon,
                  text: itensButtons[index].text,
                  selecionado: itemSelecionado == index,
                )))
      ]),
    ));
  }

  List pages = [
    const HomePage(),
    const GuidesPage(),
    const NewPostPage(),
    const ProfilePage(id: 2, isGuide: false)
  ];

  List<ItemDataButton> itensButtons = [
    ItemDataButton(
      icon: Icons.dashboard,
      text: 'Home',
    ),
    ItemDataButton(
      icon: Icons.person_search,
      text: 'Guias',
    ),
    ItemDataButton(icon: Icons.add, text: "Novo Post"),
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
