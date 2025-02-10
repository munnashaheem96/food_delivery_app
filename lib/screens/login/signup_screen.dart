import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/Login/login_form.dart';
import 'package:food_delivery_app/widgets/Login/signup_form.dart';
import 'package:food_delivery_app/widgets/Login/signup_image.dart';
import 'package:iconsax/iconsax.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main content wrapped in a Column
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Space for Signup Image (centered)
                Center(child: SignupImage()),
                SizedBox(height: 20),
                // Space for Signup Form
                SignupForm(),
              ],
            ),
          ),

          // Back Button positioned at the top left corner
          Positioned(
            top: 40,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black, size: 30),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
