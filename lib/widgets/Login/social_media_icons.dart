import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconItems(
          icon: FontAwesomeIcons.google,
          color: Colors.red,
          onPressed: () {
            // Handle Google login here
          },
        ),
        SizedBox(width: 20),
        IconItems(
          icon: FontAwesomeIcons.facebook,
          color: Colors.blue,
          onPressed: () {
            // Handle Facebook login here
          },
        ),
        SizedBox(width: 20),
        IconItems(
          icon: FontAwesomeIcons.apple,
          color: Colors.black,
          onPressed: () {
            // Handle Twitter login here
          },
        ),
      ],
    );
  }
}

class IconItems extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const IconItems({
    Key? key,
    required this.icon,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[200] ?? Colors.grey),
        ),
        child: Icon(
          icon,
          color: color,
          size: 30,
        ),
      ),
    );
  }
}
