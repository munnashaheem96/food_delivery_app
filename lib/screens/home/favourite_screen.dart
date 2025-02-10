import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/bottom_nav_bar.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> favouriteItems = [
      'Pizza',
      'Burger',
      'Pasta',
      'Sushi',
      'Ice Cream'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Items'),
      ),
      body: ListView.builder(
        itemCount: favouriteItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favouriteItems[index]),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 2),
    );
  }
}