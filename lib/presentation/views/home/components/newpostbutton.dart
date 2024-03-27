
import 'package:flutter/material.dart';
import 'package:pov/presentation/views/post/newpost_page.dart';
import 'package:pov/services/core/colorpallete.dart';

class NewPostButton extends StatelessWidget {
  const NewPostButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const NewPostPage()));
      },
      child: Container(
          width: size.width,
          margin: const EdgeInsets.only(bottom: 10),
          height: 70,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: const Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: ColorPallete.primaryColor,
                width: 0.5
              )),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Heeey! Que tal criar um post?",
                style: TextStyle(
                    color: ColorPallete.primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              Text("Clique aqui e compartilhe conosco uma experiência!", style: TextStyle(color: ColorPallete.labelColor),)
            ],
          )),
    );
  }
}
