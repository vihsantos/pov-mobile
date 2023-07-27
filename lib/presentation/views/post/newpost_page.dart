import 'package:flutter/material.dart';

class NewPostPage extends StatefulWidget {
  const NewPostPage({super.key});

  @override
  State<NewPostPage> createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
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
              TextField(
                keyboardType: TextInputType.number,
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
