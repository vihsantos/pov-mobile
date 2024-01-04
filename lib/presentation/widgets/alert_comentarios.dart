import 'package:flutter/material.dart';
import 'package:pov/presentation/widgets/comment_container.dart';

import '../../services/core/colorpallete.dart';

class AlertComentarios extends StatelessWidget {
  const AlertComentarios({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Comentários",
                  style: TextStyle(
                      fontSize: 20,
                      color: ColorPallete.labelColor,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    width: size.width,
                    height: 330,
                    child: const SingleChildScrollView(
                      child: Column(
                        children: [
                          CommentContainer(),
                          CommentContainer(),
                          CommentContainer(),
                          CommentContainer(),
                          CommentContainer(),
                          CommentContainer()
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    width: size.width,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 198, 198, 226),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: size.width * 0.75,
                          height: 100,
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none
                            ),
                          ),
                        ),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.send, color: ColorPallete.primaryColor,))
                      ],
                    ),
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