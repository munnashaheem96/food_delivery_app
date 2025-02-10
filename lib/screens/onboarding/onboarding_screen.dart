import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/onboarding/onboarding_data.dart';
import 'package:food_delivery_app/widgets/onboarding/onboarding_text.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/onboarding/onboarding_image.dart';
import '../../widgets/onboarding/onboarding_dots.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController();
  int _currentPage = 0;

  void _completeOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingCompleted', true);
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      int nextPage = _controller.page!.round();
      if (_currentPage != nextPage) {
        setState(() {
          _currentPage = nextPage;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              // Single PageView for both image and text
              Expanded(
                flex: 2,
                child: Center( // Center all items except button
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: onboardingData.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OnboardingImage(
                            image: onboardingData[index]["image"]!,
                          ),
                          SizedBox(height: 30),
                          // Dots
                          OnboardingDots(
                            currentIndex: _currentPage,
                            totalPages: onboardingData.length,
                          ),
                          SizedBox(height: 20),
                          OnboardingText(
                            title: onboardingData[index]["title"]!,
                            description: onboardingData[index]["description"]!,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          
          // Back Button only on pages after the first
          if (_currentPage > 0)
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
                child: IconButton(
                  icon: Icon(Iconsax.arrow_left_24, color: Colors.black, size: 30),
                  onPressed: () {
                    _controller.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                ),
              ),
            ),
          
          Positioned(
            bottom: 90,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  if (_currentPage == onboardingData.length - 1) {
                    _completeOnboarding();
                  } else {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                },
                child: Text(
                  _currentPage == onboardingData.length - 1 ? "Get Started" : "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                ),
              ),
            ),
          ),
          ),
        ],
      ),
    );
  }
}
