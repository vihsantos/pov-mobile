import 'package:flutter/material.dart';

class GuidesPage extends StatefulWidget {
  const GuidesPage({super.key});

  @override
  State<GuidesPage> createState() => _GuidesPageState();
}

class _GuidesPageState extends State<GuidesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GridView.count(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          padding: EdgeInsets.all(10),
          crossAxisCount: 2, 
          children: const [
            GuideCard(),
            GuideCard(),
            GuideCard(),
            GuideCard(),
            GuideCard()
          ],
          ))
    );
  }
}

class GuideCard extends StatelessWidget {
  const GuideCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.lightBlueAccent,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100)),
            ),
            const Text("luan",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold)),
            const Text(
                "area de atuação, area de atuação, area de atuação"),
            Container(
              width: 120,
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                  child: Text(
                "Seguir",
                style: TextStyle(color: Colors.white),
              )),
            )
          ],
        ),
      ),
    );
  }
}
