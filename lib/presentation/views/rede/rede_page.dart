import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pov/presentation/controllers/redepage_controller.dart';
import 'package:pov/presentation/widgets/card_post.dart';
import 'package:pov/repository/post_repository.dart';
import 'package:pov/services/core/colorpallete.dart';

class RedePage extends StatefulWidget {
  const RedePage({super.key});

  @override
  State<RedePage> createState() => _RedePageState();
}

class _RedePageState extends State<RedePage> {
  RedePageController controller = RedePageController(repository: PostRepository());
  ScrollController pageScroll = ScrollController();

  ScrollController postScroll = ScrollController();

  @override
  void initState() {
    controller.listarTodosPosts();
    pageScroll.addListener(carregarDados);
    super.initState();
  }

  carregarDados(){

    bool posts = (controller.qtdPosts > 0 ) & (controller.qtdPosts > 10) & (controller.qtdPosts > controller.skip);
    if((pageScroll.position.pixels == pageScroll.position.maxScrollExtent) & posts){
      log("chegou ao fim");
      controller.listarMaisPosts();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPallete.bgColor,
        appBar: AppBar(
              scrolledUnderElevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: const Text(
                "Minha Rede",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              controller: pageScroll,
              scrollDirection: Axis.vertical,
              child: ValueListenableBuilder<bool?>(
                    valueListenable: controller.loadingApi,
                    builder: (_, loading, __) {
                      if (loading!) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if(controller.posts == null){
                        return Center(child: Text("Nenhum post encontrado."),);
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
                    },
                  ),
            ),
          ),
      ),
    );
  }
}