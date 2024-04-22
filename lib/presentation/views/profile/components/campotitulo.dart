// ignore_for_file: must_be_immutable

import 'package:flutter/widgets.dart';
import 'package:pov/services/core/colorpallete.dart';

class CampoTitulo extends StatelessWidget {
  String titulo;

  CampoTitulo({
    Key? key,
    required this.titulo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(titulo,
        style: const TextStyle(
            color: ColorPallete.labelColor,
            fontWeight: FontWeight.bold,
            fontSize: 13));
  }
}