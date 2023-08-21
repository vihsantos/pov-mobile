import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:pov/presentation/widgets/bottom_navigation.dart';
// ignore: depend_on_referenced_packages
import 'package:latlong2/latlong.dart';
import '../../../dto/post_dto.dart';
import '../../../repository/post_repository.dart';
import '../../controllers/homepage_controller.dart';
import '../../widgets/search.dart';
import 'components/card_destaque.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageController controller = HomePageController(PostRepository());

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
              "Home",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
          backgroundColor: Colors.white,
          bottomNavigationBar: const BottomNavigation(),
          body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    height: size.height * 0.2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FlutterMap(
                        options: MapOptions(
                            center: LatLng(-12.9704, -38.5124), zoom: 15),
                        children: [
                          TileLayer(
                            urlTemplate:
                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            userAgentPackageName: 'com.example.app',
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Destaques da semana:",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                        color: Color(0xFF393434)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: SizedBox(
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
                                return const Center(
                                    child: CircularProgressIndicator());
                              })),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Search()));
                    },
                    child: Container(
                      child: Text("Search"),
                    ),
                  )
                ]),
          )),
    );
  }
}
