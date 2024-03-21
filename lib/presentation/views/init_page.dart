import 'package:flutter/material.dart';
import 'package:pov/presentation/views/guides/guides_page.dart';
import 'package:pov/presentation/views/home/home_page.dart';
import 'package:pov/presentation/views/profile/profile_page.dart';
import 'package:pov/presentation/views/ranking/ranking_page.dart';
import 'package:pov/presentation/widgets/bottom_navigation.dart';
import 'package:pov/repository/login_repository.dart';
import 'package:pov/services/singleton/auth_singleton.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      body: PageView(
        controller: null,
        onPageChanged: (index){
          print(index);
        },
        children: [
          HomePage(),
          GuidesPage(),
          RankingPage(),
          ProfilePage(isGuide: AuthSingleton(LoginRepository()).getGuide()!, id: AuthSingleton(LoginRepository()).getId()!)
        ],
      )
    );
  }
}