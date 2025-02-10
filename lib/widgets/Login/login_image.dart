import 'package:flutter/material.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15), // Adjust padding as needed
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(context).primaryColor, // Change the color of the border to the primary color
          width: 2,
        ),
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/images/onboarding4.avif',
          height: 200,
          width: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}