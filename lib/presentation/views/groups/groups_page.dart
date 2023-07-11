import 'package:flutter/material.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Grupos",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
          ),
        ),
        body: Padding(padding: const EdgeInsets.all(15), child: Container()),
      ),
    );
  }
}
