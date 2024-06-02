import 'package:flutter/material.dart';

class ProfileIconCard extends StatelessWidget {
  final String? profileIcon;
  final String username;

  const ProfileIconCard({
    super.key, this.profileIcon, required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return profileIcon != null ? SizedBox(
      width: 100,
      height: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.network(profileIcon!, fit: BoxFit.cover,)
      ),
    ) : Container(
      width: 100,
      height: 100,
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