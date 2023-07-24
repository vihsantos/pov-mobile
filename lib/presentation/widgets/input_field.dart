import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.label,
    required this.child,
  });

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
                color: Color(0xFF393434),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          Container(
            width: size.width,
            height: 60,
            decoration: BoxDecoration(
                color: const Color(0xFFF6F6FC),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
