import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/home/categories_data.dart';
import 'package:food_delivery_app/widgets/bottom_nav_bar.dart';
import 'package:food_delivery_app/widgets/home/category_widget.dart';
import 'package:food_delivery_app/widgets/home/discover_item.dart';
import 'package:food_delivery_app/widgets/home/header_home.dart';
import 'package:food_delivery_app/widgets/home/top_picks.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:food_delivery_app/data/home/banner_data.dart';  

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.85, initialPage: 1);
  int _currentPage = 1;
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Center(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // App Bar Row
                    HeaderHome(),

                    // Banners with PageView
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            SizedBox(
                              height: 150,
                              child: PageView.builder(
                                controller: _pageController,
                                onPageChanged: (index) {
                                  setState(() {
                                    _currentPage = index;
                                  });
                                },
                                itemCount: banners.length,
                                itemBuilder: (context, index) {
                                  final banner = banners[index];
                                  return AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    margin: EdgeInsets.symmetric(horizontal: index == _currentPage ? 5 : 10),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.secondary,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 15,
                                          left: 20,
                                          child: SizedBox(
                                            width: 200,
                                            child: Text(
                                              banner.text,
                                              maxLines: 2,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Color.fromARGB(255, 0, 0, 0),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 20,
                                          left: 20,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Theme.of(context).colorScheme.primary,
                                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: Text(
                                              banner.buttonText,
                                              style: TextStyle(
                                                color: Theme.of(context).colorScheme.secondary,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 20,
                                          left: 180,
                                          child: Image.asset(
                                            banner.image,
                                            height: 130,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),

                            const SizedBox(height: 10),

                            // Page Indicator
                            SmoothPageIndicator(
                              controller: _pageController,
                              count: banners.length,
                              effect: ExpandingDotsEffect(
                                activeDotColor: Theme.of(context).colorScheme.primary,
                                dotColor: Colors.grey.shade400,
                                dotHeight: 8,
                                dotWidth: 8,
                              ),
                            ),

                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Categories',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'See All Categories',
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            
                            // Categories Row
                            SizedBox(
                              height: 40,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: categories.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _selectedCategoryIndex = index;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: CategoryWidget(
                                        category: categories[index],
                                        isSelected: index == _selectedCategoryIndex,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            TopPicks(),
                            const SizedBox(height: 20),
                            DiscoverItem(),
                            const SizedBox(height: 80), // Space for navigation bar
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Positioned Navigation Bar
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: BottomNavBar(currentIndex: 0,)
        ),
      ],
    );
  }
}
