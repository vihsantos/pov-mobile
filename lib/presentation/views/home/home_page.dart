import 'package:flutter/material.dart';
import 'package:pov/dto/trail_dto.dart';
import 'package:pov/presentation/views/trails/components/trailcard.dart';
import 'package:pov/presentation/widgets/bottom_navigation.dart';
import 'package:pov/repository/trail_repository.dart';
import '../../../dto/post_dto.dart';
import '../../../repository/post_repository.dart';
import '../../controllers/homepage_controller.dart';
import 'components/card_destaque.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageController controller = HomePageController(PostRepository(), TrailRepository());

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
              "Home",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
          backgroundColor: Colors.white,
          bottomNavigationBar: const BottomNavigation(),
          body: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Trilhas",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 220,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: FutureBuilder<List<TrailDTO?>?>(
                              future: controller.listarTrilhas(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  List<TrailDTO?>? trails = snapshot.data;

                                  if (trails!.isEmpty) {
                                    return Container();
                                  }

                                  if(controller.error != null){
                                    return Text(controller.error!.mensagem);
                                  }

                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemCount: trails.length,
                                          itemBuilder: (_, index) {
                                            final trail = trails[index];

                                            return TrailCard(trilha: trail!);
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
                    const SizedBox(height: 10),
                    const Text(
                      "Posts",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 270,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: FutureBuilder<List<PostDTO?>?>(
                              future: controller.listarPosts(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  List<PostDTO?>? posts = snapshot.data;

                                  if (posts!.isEmpty) {
                                    return Container();
                                  }

                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemCount: posts.length,
                                          itemBuilder: (_, index) {
                                            final post = posts[index];

                                            return CardDestaque(post: post!);
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
                  ]),
            ),
          )),
    );
  }
}
