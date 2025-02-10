import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/bottom_nav_bar.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      bottomNavigationBar: BottomNavBar(currentIndex: 4),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey[400] ?? Colors.grey,
                        width: 1,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey[400] ?? Colors.grey,
                        width: 1,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Iconsax.setting),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                clipBehavior: Clip.none,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: -20,
                        left: 0,
                        right: 0,
                        child: Align(
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 5,
                              ),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/items_images/banana.jpg',
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 150,
                        left: 0,
                        right: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'John Doe',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'dummymail@mail.com',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 20),
                            _buildProfileItem(
                              iconItems: Iconsax.edit_2,
                              textItems: 'Edit profile',
                              showArrow: true
                            ),
                            SizedBox(height: 10,),
                            _buildProfileItem(
                              iconItems: Iconsax.heart,
                              textItems: 'Favourite',
                              showArrow: true
                            ),
                            SizedBox(height: 10,),
                            _buildProfileItem(
                              iconItems: Iconsax.location,
                              textItems: 'Location',
                              showArrow: true
                            ),
                            SizedBox(height: 10,),
                            _buildProfileItem(
                              iconItems: Iconsax.clock,
                              textItems: 'History',
                              showArrow: true
                            ),
                            SizedBox(height: 10,),
                            _buildProfileItem(
                              iconItems: Iconsax.info_circle,
                              textItems: 'History',
                              showArrow: true
                            ),
                            SizedBox(height: 10,),
                            _buildProfileItem(
                              iconItems: Iconsax.password_check,
                              textItems: 'Change password',
                              showArrow: true
                            ),
                            SizedBox(height: 10,),
                            _buildProfileItem(
                              iconItems: Iconsax.logout,
                              textItems: 'Logout',
                              showArrow: false
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

Widget _buildProfileItem({required IconData iconItems, required String textItems, bool showArrow = true}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[300] ?? Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(iconItems),
                SizedBox(width: 15),
                Text(
                  textItems,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            if (showArrow) Icon(Iconsax.arrow_right_3), // Show arrow only if showArrow is true
          ],
        ),
      ),
    ),
  );
}
}