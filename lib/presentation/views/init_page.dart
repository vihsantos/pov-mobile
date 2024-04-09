// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pov/presentation/views/guides/guides_page.dart';
import 'package:pov/presentation/views/home/home_page.dart';
import 'package:pov/presentation/views/introduction/introduction_page.dart';
import 'package:pov/presentation/views/profile/profile_page.dart';
import 'package:pov/presentation/views/ranking/ranking_page.dart';
import 'package:pov/presentation/widgets/bottom_navigation.dart';
import 'package:pov/repository/login_repository.dart';
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
    return PopScope(
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
          bottomNavigationBar: BottomNavigation(
            trocaIndex: (index) {
              setState(() {
                _indiceAtual = index;
              });
            },
            itemSelecionado: _indiceAtual!,
          ),
          body: PageView(
            controller: pageController,
            onPageChanged: (index) {
              // ignore: avoid_print
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
    );
  }
}
