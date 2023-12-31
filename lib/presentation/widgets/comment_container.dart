import 'package:flutter/material.dart';

import '../../services/core/colorpallete.dart';

class CommentContainer extends StatelessWidget {
  const CommentContainer({
    super.key,
  });

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
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "username",
            style: TextStyle(fontWeight: FontWeight.bold, color: ColorPallete.labelColor),
          ),
          Text(
            "comentário comentário comentário comentário comentário comentário comentário comentário comentário",
            style: TextStyle(color: ColorPallete.labelColor),
          ),
        ],
      ),
    );
  }
}
