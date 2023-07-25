import 'package:flutter/material.dart';

class CardComment extends StatelessWidget {
  const CardComment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10)
      ),
      child: const Padding(
        padding: EdgeInsets.all(10),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("vitoria", 
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
            const SizedBox(
                height: 5,
              ),
            Text("data data data data data data data data data data data data data data data data data data data data data", maxLines: 3,)
          ],
        ),
      ),
    );
  }
}
