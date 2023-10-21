import 'package:flutter/material.dart';

import '../../widgets/input_field.dart';

class NewTrailPage extends StatefulWidget {
  const NewTrailPage({super.key});

  @override
  State<NewTrailPage> createState() => _NewTrailPageState();
}

class _NewTrailPageState extends State<NewTrailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [InputField(label: "Olá", child: Container())],
        ),
      ),
    );
  }
}
