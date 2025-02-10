import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavBar extends StatefulWidget {
  final int currentIndex;

  const BottomNavBar({super.key, required this.currentIndex});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  void _onItemTapped(int index) {
    String route = '/home'; // Default route

    switch (index) {
      case 0:
        route = '/home';
        break;
      case 1:
        route = '/cart';
        break;
      case 2:
        route = '/favorites';
        break;
      case 3:
        route = '/orders';
        break;
      case 4:
        route = '/profile';
        break;
    }

    if (ModalRoute.of(context)?.settings.name != route) {
      Navigator.pushNamed(context, route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      color: Color(0xFFF4F6F5),
      buttonBackgroundColor: Theme.of(context).colorScheme.primary,
      index: widget.currentIndex,
      items: [
        Icon(Iconsax.home, color: widget.currentIndex == 0 ? Colors.white : Colors.black),
        Icon(Iconsax.shopping_cart, color: widget.currentIndex == 1 ? Colors.white : Colors.black),
        Icon(Iconsax.heart, color: widget.currentIndex == 2 ? Colors.white : Colors.black),
        Icon(Iconsax.clipboard_text, color: widget.currentIndex == 3 ? Colors.white : Colors.black),
        Icon(Iconsax.user, color: widget.currentIndex == 4 ? Colors.white : Colors.black),
      ],
      onTap: _onItemTapped,
    );
  }
}
