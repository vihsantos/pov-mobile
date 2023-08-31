import 'package:flutter/material.dart';

class ProfileIconCard extends StatelessWidget {
  final String? profileIcon;
  final String username;

  const ProfileIconCard({
    super.key, this.profileIcon, required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return profileIcon != null ? Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100)),
    ) : Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100)
          ),
      child: Center(
        child: Text(
          username.characters.first.toUpperCase(),
          style: const TextStyle(fontSize: 78, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}