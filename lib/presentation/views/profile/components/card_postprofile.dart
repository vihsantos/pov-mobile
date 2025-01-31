// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../models/post/postprofile_model.dart';
import '../../post/postdetails_page.dart';

class CardPostProfile extends StatelessWidget {
  final PostProfileModel post;
  const CardPostProfile({
    Key? key,
    required this.post,
  }) : super(key: key);

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
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
            SizedBox(
                width: 200,
                height: 200,
                child: Image.network(post.image_url!, fit: BoxFit.cover)),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                width: 60,
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
                      post.stars.toString(),
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
      ),
    );
  }
}
