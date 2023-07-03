import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.person_search), label: "Guias"),
      BottomNavigationBarItem(icon: Icon(Icons.group), label: "Grupos"),
      BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Perfil")
    ]);
  }
}
