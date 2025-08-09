import 'package:auth_screens/widgets/rounded_container.dart';
import 'package:flutter/material.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({super.key, this.onTap, required this.imagePath});

  final void Function()? onTap;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RoundedContainer(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        child: Image.asset(imagePath),
      ),
    );
  }
}
