import 'package:flutter/material.dart';
import 'package:pov/dto/guide_dto.dart';
import 'package:pov/presentation/controllers/guidespage_controller.dart';
import 'package:pov/presentation/views/guides/components/guidecard.dart';
import 'package:pov/repository/guide_repository.dart';

class GuidesPage extends StatefulWidget {
  const GuidesPage({super.key});

  @override
  State<GuidesPage> createState() => _GuidesPageState();
}

class _GuidesPageState extends State<GuidesPage> {
  GuidesPageController controller = GuidesPageController(GuideRepository());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: const Text(
                "Guias",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
            body: FutureBuilder<List<GuideDTO?>?>(
              future: controller.listarGuias(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasError) {
                  return const Text("Ocorreu um erro!");
                }

                if (snapshot.data == null) {
                  return const Text("Ocorreu um erro!");
                }

                return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 260,
                            childAspectRatio: 3 / 5,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext ctx, index) {
                      GuideDTO? guia = snapshot.data![index];

                      return GuideCard(guia: guia!);
                    });
              },
            )));
  }
}
