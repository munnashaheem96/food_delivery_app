import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/home/cart_screen.dart';
import 'package:food_delivery_app/screens/home/favourite_screen.dart';
import 'package:food_delivery_app/screens/home/home_screen.dart';
import 'package:food_delivery_app/screens/home/orders_screen.dart';
import 'package:food_delivery_app/screens/home/profile_screen.dart';
import 'package:food_delivery_app/screens/login/forget_password_screen.dart';
import 'package:food_delivery_app/screens/login/login_screen.dart';
import 'package:food_delivery_app/screens/onboarding/onboarding_screen.dart';
import 'package:food_delivery_app/screens/splash/splash_screen.dart';
import 'package:food_delivery_app/screens/login/signup_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        primaryColor: Color(0xFF379570),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFF379570),
          secondary: Color(0xFFEBF4F1),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/forget-password': (context) => ForgetPasswordScreen(),
        '/cart': (context) => CartScreen(),
        '/favorites': (context) => FavouriteScreen(),
        '/orders': (context) => OrdersScreen(),
        '/profile': (context) => ProfileScreen(),       
      },
    );
  }
}
