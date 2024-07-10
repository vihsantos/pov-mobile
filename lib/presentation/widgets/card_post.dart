// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:pov/dto/post_dto.dart';
import 'package:pov/presentation/views/post/postdetails_page.dart';
import 'package:pov/services/core/colorpallete.dart';

class CardPost extends StatelessWidget {
  PostDTO post;

  CardPost({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PostDetailsPage(
                      id: post.id!,
                    )));
      },
      child: Container(
        width: size.width,
        height: size.height * 0.49,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  post.image_url!,
                ),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                width: size.width * 0.20,
                height: size.height * 0.05,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${post.stars}",
                      style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: Colors.pink),
                    ),
                    const Icon(
                      Icons.star,
                      size: 26,
                      color: Colors.pink,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  width: size.width * 0.957,
                  height: size.height * 0.15,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(125, 246, 246, 252),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            post.user!.profile != null ?
                            ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: Image.network(
                                    post.user!.profile!,
                                    fit: BoxFit.cover,
                                  )),
                            )
                            : Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: ColorPallete.bgItemColor
                              ),
                              child: const Center(child: Icon(Icons.person, size: 38, color: ColorPallete.bottomUnselectedColor,)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: size.width * 0.7,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(post.user!.username!,
                                      style: const TextStyle(
                                          color: ColorPallete.labelColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  Text(post.localization!.local!,
                                      maxLines: 2,
                                      style: const TextStyle(
                                          color: ColorPallete.labelColor,
                                          fontSize: 12)),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            // Container(
                            //   width: 55,
                            //   height: 60,
                            //   decoration: BoxDecoration(
                            //       color: ColorPallete.bgItemColor,
                            //       borderRadius: BorderRadius.circular(10)),
                            //   child: Column(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     children: [
                            //       SizedBox(
                            //           height: 35,
                            //           child: Image.asset(Utils.vooselected)),
                            //       Text(
                            //         "0",
                            //         style: TextStyle(
                            //             fontSize: 12,
                            //             fontWeight: FontWeight.w600,
                            //             color: ColorPallete.secondColor),
                            //       )
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                        Text(
                          post.description!,
                          maxLines: 3,
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
