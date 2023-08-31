import 'package:flutter/material.dart';

class ProfileIconCard extends StatelessWidget {
  final String? profileIcon;
  final String username;

  const ProfileIconCard({
    super.key, this.profileIcon, required this.username,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return profileIcon != null ? Container(
      width: size.width * 0.2,
      height: 140,
      decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(100)),
    ) : Container(
      width: size.width * 0.3,
      height: size.height * 0.15,
      decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(100)
          ),
      child: Center(
        child: Text(
          username.characters.first.toUpperCase(),
          style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}