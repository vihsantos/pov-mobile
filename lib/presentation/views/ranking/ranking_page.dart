// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pov/services/core/colorpallete.dart';
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
  void initState() {
    controller.getRankingByLocal();
    super.initState();
  }

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
        body: SizedBox(
          height: 600,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(15),
                  width: size.width,
                  height: size.height * 0.065,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 250, 250, 253),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        onChanged: (value) => controller.local = value,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.searchGetRankingByLocal();
                                },
                                icon: const Icon(
                                  Icons.search,
                                  color: ColorPallete.primaryColor,
                                )),
                            hintText: "Busque por um local...",
                            hintStyle: const TextStyle(
                                color: ColorPallete.primaryColor),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),
                ValueListenableBuilder<bool?>(
                    valueListenable: controller.loadingApi,
                    builder: (_, loading, __) {
                
                      if (loading!) {
                        return const Center(child: CircularProgressIndicator());
                      }
                
                      if(controller.error != null){
                        return Center(child: Text(controller.error!.mensagem));
                      }
                
                      if(controller.ranking!.isEmpty){
                        return const Center(child: Text("Nada encontrado"));
                      }
                
                      return SizedBox(
                        height: size.height * 0.74,
                        child: Column(
                          children: [
                            ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: controller.ranking?.length,
                                itemBuilder: (_, index) {
                                  final ranking = controller.ranking![index];
                        
                                  return CardRankingByLocal(data: ranking!);
                                })
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
