import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pov/dto/trail_dto.dart';
import 'package:pov/presentation/views/home/components/newpostbutton.dart';
import 'package:pov/presentation/views/trails/components/trailcard.dart';
import 'package:pov/presentation/widgets/card_post.dart';
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
  HomePageController controller =
      HomePageController(PostRepository(), TrailRepository());

  ScrollController scroll = ScrollController();
  ScrollController postScroll = ScrollController();
  ScrollController pageScroll = ScrollController();

  

  @override
  void initState() {
    controller.listarTodosPosts();
    pageScroll.addListener(carregarDados);
    super.initState();
  }
  

  carregarDados(){

    bool posts = (controller.qtdPosts > 0 ) | (controller.qtdPosts > controller.skip);
    if((pageScroll.position.pixels == pageScroll.position.maxScrollExtent) & posts){
      log("chegou ao fim");
      controller.listarMaisPosts();
    }
  }
  

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
          body: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SingleChildScrollView(
              controller: pageScroll,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const NewPostButton(),
                    const Text(
                      "Posts cinco estrelas mais recentes",
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
                                    return const Center(
                                        child: Text("Nada encontrado!"));
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
                    const Text(
                      "Trilhas recentes",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 320,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: FutureBuilder<List<TrailDTO?>?>(
                              future: controller.listarTrilhas(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  List<TrailDTO?>? trails = snapshot.data;
                      
                                  if (trails!.isEmpty) {
                                    return const Center(
                                        child: Text("Nada encontrado!"));
                                  }
                      
                                  if (controller.error != null) {
                                    return Text(controller.error!.mensagem);
                                  }
                      
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ListView.builder(
                                          controller: scroll,
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
                                return Container();
                              })),
                    ),
                    const SizedBox(height: 10),
                    ValueListenableBuilder<bool?>(
                    valueListenable: controller.loadingApi,
                    builder: (_, loading, __) {
                
                      if (loading!) {
                        return const Center(child: CircularProgressIndicator());
                      }
                
                      if(controller.error != null){
                        return Center(child: Text(controller.error!.mensagem));
                      }
                
                      if(controller.posts!.isEmpty){
                        return const Center(child: Text("Nada encontrado"));
                      }
                
                      return Column(
                        children: [
                          ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: controller.posts?.length,
                              controller: postScroll,
                              itemBuilder: (_, index) {
                                final post = controller.posts![index];
                                return CardPost(post: post,);
                              })
                        ],
                      );
                    }),
                  ]),
            ),
          )),
    );
  }
}