// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pov/models/ranking/rankingbylocal_model.dart';

import '../../../repository/ranking_repository.dart';
import '../../controllers/rankingpage_controller.dart';
import 'components/cardrankingbylocal.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  RankingPageController controller =
      RankingPageController(rankingRepository: RankingRepository());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Ranking",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Filtrar Por:",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color(0xFF8C8C8C))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * 0.45,
                    height: size.height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.amber),
                  ),
                  Container(
                    width: size.width * 0.45,
                    height: size.height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.pink),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: FutureBuilder<List<RankingByLocalModel?>?>(
                      future: controller.getRankingByLocal(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<RankingByLocalModel?>? ranking = snapshot.data;

                          if (ranking!.isEmpty) {
                            return Container();
                          }

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: ranking.length,
                                  itemBuilder: (_, index) {
                                    final data = ranking[index];

                                    return CardRankingByLocal(data: data!);
                                  })
                            ],
                          );
                        }

                        if (snapshot.hasError) {
                          return const Text("ERROR");
                        }
                        return const Center(child: CircularProgressIndicator());
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
