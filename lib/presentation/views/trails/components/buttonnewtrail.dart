import 'package:flutter/material.dart';

import '../../../../services/core/colorpallete.dart';
import '../newtrail_page.dart';

class ButtonNewTrail extends StatelessWidget {
  const ButtonNewTrail({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const NewTrailPage()));
      },
      child: Container(
        width: size.width * 0.14,
        height: size.height * 0.07,
        decoration: BoxDecoration(
            color: ColorPallete.bgItemColor,
            borderRadius: BorderRadius.circular(10)),
        child: const Center(
            child: Icon(
          Icons.add_photo_alternate_rounded,
          color: ColorPallete.secondColor,
          size: 28,
        )),
      ),
    );
  }
}

