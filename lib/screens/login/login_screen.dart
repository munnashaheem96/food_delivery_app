import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/Login/login_form.dart';
import 'package:food_delivery_app/widgets/Login/login_image.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Space for Login Image (centered)
            Center(child: LoginImage()),
            SizedBox(height: 20),
            // Space for Login Form
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
