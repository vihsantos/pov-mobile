import 'package:flutter/widgets.dart';

class ImagemTrilha extends StatelessWidget {
  String url;

  ImagemTrilha({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        url,
        fit: BoxFit.cover,
      ),
    );
  }
}