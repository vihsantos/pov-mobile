// ignore_for_file: must_be_immutable
import 'package:flutter/widgets.dart';
import '../../services/core/colorpallete.dart';

class Pontinho extends StatelessWidget {
  bool selecionado;

  Pontinho({
    Key? key,
    required this.selecionado,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: selecionado ? 10 : 8,
      height: 8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: selecionado
              ? ColorPallete.primaryColor
              : ColorPallete.bottomUnselectedColor),
    );
  }
}
