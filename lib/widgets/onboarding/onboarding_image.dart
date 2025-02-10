import 'package:flutter/material.dart';

class OnboardingImage extends StatelessWidget {
  final String image;

  const OnboardingImage({
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
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
              image,
              height: 300,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
