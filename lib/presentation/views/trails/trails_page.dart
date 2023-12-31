import 'package:flutter/material.dart';
import 'package:pov/presentation/controllers/trailpage_controller.dart';
import 'package:pov/repository/trail_repository.dart';
import 'components/trailcard.dart';

class TrailsPage extends StatefulWidget {
  const TrailsPage({super.key, required this.id});

  final int id;
  @override
  State<TrailsPage> createState() => _TrailsPageState();
}

class _TrailsPageState extends State<TrailsPage> {
  TrailPageController controller =
      TrailPageController(repository: TrailRepository());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Trilhas de ",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
        backgroundColor: Colors.white,
        body: const SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: []),
        ),
      ),
    );
  }
}
