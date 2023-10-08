// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../dto/post_dto.dart';
import '../../post/postdetails_page.dart';

class CardDestaque extends StatelessWidget {
  final PostDTO post;

  const CardDestaque({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PostDetailsPage(
                      id: post.id!,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Stack(children: [
          Container(
            width: 180,
            height: 260,
            decoration: BoxDecoration(
                color: const Color(0xFFF8F8F8),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 160,
                  height: 160,
                  margin: const EdgeInsets.only(top: 10, left: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      post.imageUrl!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(post.user!.username!),
                            Text(
                              post.localization == null
                                  ? "oi"
                                  : post.localization!.local!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 9),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    post.description!,
                    maxLines: 1,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 15,
            right: 15,
            child: Container(
              width: 55,
              height: 30,
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    color: Color.fromARGB(33, 0, 0, 0))
              ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${post.stars}",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.star,
                    size: 18,
                    color: Colors.pink,
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
