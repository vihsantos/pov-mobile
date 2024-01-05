import 'package:flutter/material.dart';
import 'package:pov/dto/trail_dto.dart';
import 'package:pov/models/user/userpost_model.dart';
import 'package:pov/presentation/views/trails/components/trailcard.dart';

class TestViewPage extends StatefulWidget {
  const TestViewPage({super.key});

  @override
  State<TestViewPage> createState() => _TestViewPageState();
}

class _TestViewPageState extends State<TestViewPage> {
  @override
  Widget build(BuildContext context) {
    TrailDTO trilha = TrailDTO(
        description:
            "Etiam laoreet, lectus a blandit aliquam, massa mi sodales metus, ac ultricies turpis ipsum in. Etiam laoreet, lectus a blandit aliquam, massa mi sodales metus, ac ultricies turpis ipsum in.",
        occupation: "1; ",
        files:
            "https://thumbs.dreamstime.com/b/superf%C3%ADcie-surfando-da-%C3%A1gua-onda-de-oceano-do-mar-124362369.jpg;https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Por_do_sol_sobre_o_mar_do_maranh%C3%A3o.jpg/2560px-Por_do_sol_sobre_o_mar_do_maranh%C3%A3o.jpg;",
        id: 1,
        name: "Vestibulum vitae sodales felis. Etiam.",
        user: UserPostModel(id: 1, username: "alessandra"));
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [TrailCard(trilha: trilha)],
          ),
        ),
      ),
    );
  }
}
