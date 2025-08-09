import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Surya',
          style: TextStyle(
            color: Colors.white,
            fontSize: 48,
            fontFamily: 'Lavishly_Yours',
          ),
        ),
        SizedBox(height: 50),
      ],
    );
  }
}
