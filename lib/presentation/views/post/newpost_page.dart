import 'package:flutter/material.dart';
import 'package:pov/presentation/widgets/input_field.dart';

class NewPostPage extends StatefulWidget {
  const NewPostPage({super.key});

  @override
  State<NewPostPage> createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                width: size.width,
                height: 450,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 223, 222, 222),
                    borderRadius: BorderRadius.circular(10)),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.panorama,
                      size: 128,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Toque aqui para selecionar a foto do seu post",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
            ),
            InputField(label: "Localização: ", child: Container()),
            InputField(
                label: "Avaliação:",
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(
                      Icons.star,
                      size: 24,
                      color: Colors.pink,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (value <= 0) {
                            return;
                          }
                          value = value - 1;
                        });
                      },
                      child: const Icon(Icons.remove),
                    ),
                    Text(
                      value.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (value > 4) {
                            return;
                          }
                          value = value + 1;
                        });
                      },
                      child: const Icon(Icons.add),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
