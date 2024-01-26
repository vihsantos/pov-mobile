import 'package:flutter/material.dart';
import 'package:pov/presentation/controllers/trailpage_controller.dart';
import 'package:pov/repository/trail_repository.dart';
import '../../../dto/trail_dto.dart';
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
            "Trilhas",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: FutureBuilder<List<TrailDTO?>?>(
                future: controller.listarTrilhas(widget.id),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<TrailDTO?>? trails = snapshot.data;

                    if (trails!.isEmpty) {
                      return const Center(child: Text("Nada encontrado!"));
                    }

                    if (controller.error != null) {
                      return Text(controller.error!.mensagem);
                    }

                    return Column(
                      children: [
                        ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: trails.length,
                            itemBuilder: (_, index) {
                              final trail = trails[index];

                              return Padding(
                                padding: const EdgeInsets.all(15),
                                child: TrailCard(trilha: trail!),
                              );
                            })
                      ],
                    );
                  }

                  if (snapshot.hasError) {
                    return const Text("ERROR");
                  }

                  return Container();
                })),
      ),
    );
  }
}
