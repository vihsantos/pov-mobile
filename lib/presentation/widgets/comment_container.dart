// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../models/comment_model.dart';
import '../../services/core/colorpallete.dart';

// ignore: must_be_immutable
class CommentContainer extends StatelessWidget {
  CommentModel comentario;

  CommentContainer({
    Key? key,
    required this.comentario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 233, 233, 236),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            comentario.user!.username!,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: ColorPallete.labelColor),
          ),
          Text(
            comentario.description!,
            style: const TextStyle(color: ColorPallete.labelColor),
          ),
        ],
      ),
    );
  }
}
