import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/home/categories_data.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;
  final bool isSelected; // Add this to track selected state

  const CategoryWidget({
    super.key,
    required this.category,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).colorScheme.primary // Apply primary color if selected
            : Theme.of(context).colorScheme.secondary, // Default color
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  category.imagePath,
                  height: 20,
                ),
              ),
            ),
            const SizedBox(width: 5),
            Text(
              category.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black, // Change text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
