import 'package:flutter/material.dart';
import 'package:pov/dto/post_dto.dart';
import 'package:pov/presentation/views/post/postdetails_page.dart';
import 'package:pov/services/core/colorpallete.dart';

// ignore: must_be_immutable
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
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          width: size.width,
          height: size.height * 0.59,
          decoration: BoxDecoration(
            color: ColorPallete.bgItemColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                      width: size.width,
                      height: size.height * .4,
                      child: Image.network(
                        post.image_url!,
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(height: 10),
                Container(
                  width: size.width,
                  height: size.height * .135,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          post.user!.profile == null ?
                            Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: ColorPallete.labelColor),
                          ) :
                          SizedBox(
                            width: size.width * .12,
                            height: size.width * .12,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(post.user!.profile!, fit: BoxFit.cover,),
                            ),
                          ), 
                          SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(post.user!.username!,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      color: ColorPallete.labelColor)),
                              SizedBox(
                                  width: size.width * .67,
                                  child: Text(
                                    post.localization!.local!,
                                    maxLines: 3,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: ColorPallete.secondColor),
                                  ))
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: size.height * .035,
                        child: Text(
                          post.description!,
                          maxLines: 2,
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
