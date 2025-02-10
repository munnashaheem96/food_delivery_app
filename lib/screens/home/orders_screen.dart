import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/bottom_nav_bar.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for orders
    final List<String> orders = [
      'Order 1: Pizza',
      'Order 2: Burger',
      'Order 3: Pasta',
      'Order 4: Salad',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(orders[index]),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 3),
    );
  }
}