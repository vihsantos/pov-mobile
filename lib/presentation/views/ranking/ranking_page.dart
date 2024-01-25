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
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Ranking",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.74,
              child: FutureBuilder<List<RankingByLocalModel?>?>(
                  future: controller.getRankingByLocal(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<RankingByLocalModel?>? ranking = snapshot.data;

                      if (ranking!.isEmpty) {
                        return Container();
                      }

                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: ranking.length,
                          shrinkWrap: true,
                          itemBuilder: (_, index) {
                            final data = ranking[index];

                            return CardRankingByLocal(data: data!);
                          });
                    }

                    if (snapshot.hasError) {
                      return const Text("ERROR");
                    }
                    return const Center(child: CircularProgressIndicator());
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
