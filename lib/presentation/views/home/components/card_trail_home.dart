import 'package:flutter/material.dart';

class CardTrailHome extends StatelessWidget {
  const CardTrailHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.65,
      height: size.height * 0.21,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFF8F8F8)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: size.width * 0.30,
                height: size.height * 0.145,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.orangeAccent),
              ),
              SizedBox(
                width: size.width * 0.30,
                height: size.height * 0.145,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("username"),
                    Text("Trail name",
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14)),
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ullamcorper.",
                        maxLines: 5,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 11))
                  ],
                ),
              )
            ],
          ),
          const Text(
            "localização, localização, localização localização",
            maxLines: 2,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
