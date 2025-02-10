import 'dart:math';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/home/items_data.dart';
import 'package:food_delivery_app/models/discover_item_model.dart';
import 'package:food_delivery_app/widgets/home/item_details_page.dart';

class DiscoverItem extends StatelessWidget {
  const DiscoverItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Discover',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                // Handle "See all" action
              },
              child: const Text('See all', style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const DiscoverCategories(),
        const SizedBox(height: 20),
      ],
    );
  }
}

class DiscoverCategories extends StatefulWidget {
  const DiscoverCategories({super.key});

  @override
  _DiscoverCategoriesState createState() => _DiscoverCategoriesState();
}

class _DiscoverCategoriesState extends State<DiscoverCategories> {
  int activeIndex = 0;
  List<String> categories = ["All", "For you", "Vegetables", "Fruits", "Foods"];
  List<DiscoverItemModel> filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filterItems(); // Load all items initially
  }

  void _filterItems() {
    setState(() {
      if (activeIndex == 0) {
        filteredItems = allItems; // Show all items
      } else if (activeIndex == 1) {
        filteredItems = _getRandomItemsFromCategories();
      } else {
        filteredItems = allItems.where((item) => item.category == categories[activeIndex]).toList();
      }
    });
  }

  List<DiscoverItemModel> _getRandomItemsFromCategories() {
    List<DiscoverItemModel> randomItems = [];
    Random random = Random();
    List<String> otherCategories = categories.sublist(2); // Exclude "All" and "For you"

    for (String category in otherCategories) {
      List<DiscoverItemModel> itemsInCategory = allItems.where((item) => item.category == category).toList();
      if (itemsInCategory.isNotEmpty) {
        randomItems.add(itemsInCategory[random.nextInt(itemsInCategory.length)]);
      }
    }

    return randomItems;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(categories.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  activeIndex = index;
                });
                _filterItems();
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: activeIndex == index ? FontWeight.bold : FontWeight.normal,
                        color: activeIndex == index ? Theme.of(context).primaryColor : Colors.black,
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.only(top: 5),
                    height: 3,
                    width: activeIndex == index ? _getTextWidth(categories[index], context) : 0,
                    color: activeIndex == index ? Theme.of(context).primaryColor : Colors.transparent,
                  ),
                ],
              ),
            );
          }),
        ),
        const SizedBox(height: 5),
        Container(
          width: double.infinity,
          height: 1,
          color: Theme.of(context).secondaryHeaderColor.withOpacity(0.5),
        ),
        const SizedBox(height: 40),
        ItemsDiscover(items: filteredItems), // Show filtered items
      ],
    );
  }

  double _getTextWidth(String text, BuildContext context) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: const TextStyle(fontSize: 16)),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.width;
  }
}

class ItemsDiscover extends StatelessWidget {
  final List<DiscoverItemModel> items;

  const ItemsDiscover({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true, // Expand GridView fully inside a Column
      physics: const NeverScrollableScrollPhysics(), // Prevent scrolling conflicts
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two items per row
        crossAxisSpacing: 10,
        mainAxisSpacing: 15,
        childAspectRatio: 0.8, // Adjust for better spacing
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _buildItemCard(context, items[index]);
      },
    );
  }

  Widget _buildItemCard(BuildContext context, DiscoverItemModel item) {
    double containerSize = 180;
    double imageSize = 120;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetailsPage(item: item),
          ),
        );
      },
      child: Stack(
        clipBehavior: Clip.none, // Allow image to go outside the container
        alignment: Alignment.center,
        children: [
          Container(
            width: containerSize,
            height: containerSize,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Positioned(
            top: -30, // Move image up
            child: ClipOval(
              child: Image.asset(
                item.image,
                width: imageSize,
                height: imageSize,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image_not_supported, size: 100);
                },
              ),
            ),
          ),
          Positioned(
            top: -20,
            left: containerSize - 50,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
          Positioned(
            top: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(item.weight, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                const SizedBox(height: 5),
                Text(
                  '₹${item.price.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, color: Colors.blue[900], fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}