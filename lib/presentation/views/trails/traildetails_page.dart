// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pov/dto/trail_dto.dart';
import 'package:pov/presentation/controllers/trailpage_controller.dart';
import 'package:pov/presentation/views/trails/components/imagemtrilha.dart';
import 'package:pov/presentation/widgets/pontinho.dart';
import 'package:pov/repository/trail_repository.dart';

import 'package:pov/services/core/colorpallete.dart';

class TrailDetailsPage extends StatefulWidget {
  final int id;
  const TrailDetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<TrailDetailsPage> createState() => _TrailDetailsPageState();
}

class _TrailDetailsPageState extends State<TrailDetailsPage> {
  int indexSelecionado = 0;

  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: indexSelecionado);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TrailPageController controller =
        TrailPageController(repository: TrailRepository());

    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            body: FutureBuilder(
                future: controller.buscarTrilhaPorID(widget.id),
                builder:
                    (BuildContext context, AsyncSnapshot<TrailDTO?> snapshot) {
                  
                  if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

                  TrailDTO trilha = snapshot.data as TrailDTO;

                  return SingleChildScrollView(
                    child: Column(
                      children: [
                         Padding(
                           padding: const EdgeInsets.all(10),
                           child: Text(
                            trilha.name!,
                            style: const TextStyle(
                                color: ColorPallete.labelColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                                textAlign: TextAlign.center,
                                                   ),
                         ),
                        Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(20),
                              width: size.width,
                              height: size.height * 0.32,
                              decoration: BoxDecoration(
                                  color: ColorPallete.bgItemColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: PageView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.urls!.length,
                                controller: pageController,
                                onPageChanged: (value) {
                                  setState(() {
                                    print(indexSelecionado);
                                    indexSelecionado = value;
                                  });
                                },
                                itemBuilder:
                                    (BuildContext context, int itemIndex) {
                                  return ImagemTrilha(
                                    url: controller.urls![itemIndex],
                                  );
                                },
                              ),
                            ),
                            Positioned(
                                bottom: 15,
                                left: size.width * 0.45,
                                child: Row(
                                  children: [
                                    ...List.generate(
                                        controller.urls!.length,
                                        (index) => Pontinho(
                                            selecionado:
                                                indexSelecionado == index))
                                  ],
                                ))
                          ],
                        )
                      ],
                    ),
                  );
                })));
  }
}