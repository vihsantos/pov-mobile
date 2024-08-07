// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pov/presentation/views/guides/guides_page.dart';
import 'package:pov/presentation/views/home/home_page.dart';
import 'package:pov/presentation/views/introduction/introduction_page.dart';
import 'package:pov/presentation/views/profile/profile_page.dart';
import 'package:pov/presentation/views/ranking/ranking_page.dart';
import 'package:pov/presentation/widgets/bottom_navigation.dart';
import 'package:pov/repository/login_repository.dart';
import 'package:pov/services/core/colorpallete.dart';
import 'package:pov/services/singleton/auth_singleton.dart';

// ignore: must_be_immutable
class InitPage extends StatefulWidget {
  int indiceAtual;
  InitPage({
    Key? key,
    this.indiceAtual = 0,
  }) : super(key: key);

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  int? _indiceAtual;
  PageController? pageController;

  @override
  void initState() {
    _indiceAtual = widget.indiceAtual;
    pageController = PageController(initialPage: _indiceAtual!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          if (!didPop) {
            return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Deseja realmente realizar logoff?"),
                    actions: <Widget>[
                      TextButton(
                        child: const Text("Ok"),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const IntroductionPage()),
                              (Route<dynamic> route) => false);
                        },
                      ),
                    ],
                  );
                });
          }
        },
        child: Scaffold(
            bottomNavigationBar: bottomnavigation(),
            body: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  _indiceAtual = index;
                });
              },
              children: [
                const HomePage(),
                const GuidesPage(),
                const RankingPage(),
                ProfilePage(
                    isGuide: AuthSingleton(LoginRepository()).getGuide()!,
                    id: AuthSingleton(LoginRepository()).getId()!)
              ],
            )),
      ),
    );
  }

  Widget bottomnavigation(){
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Container(
      width: size.width,
      height: size.height * 0.085,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: ColorPallete.bgItemColor,
          borderRadius: BorderRadius.circular(10)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        ...List.generate(
            itensButtons.length,
            (index) => InkWell(
              onTap: () {
                print(index);
                setState(() {
                   _indiceAtual = index;
                   animatePage(_indiceAtual!);
                });
                
              },
              child: ItemBottom(
                icon: itensButtons[index].icon,
                text: itensButtons[index].text,
                selecionado: _indiceAtual == index,
              ),
            ))
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

  void animatePage(int index) {
    pageController!.animateToPage(index,
        duration: Duration(milliseconds: 200), curve: Curves.bounceInOut);
  }
}
