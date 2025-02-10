// banner_data.dart

class BannerData {
  final String image;
  final String text;
  final String buttonText;

  BannerData({required this.image, required this.text, required this.buttonText});
}

// Store the banner data here
List<BannerData> banners = [
  BannerData(
    image: 'assets/images/grocery.png',
    text: 'Explore Latest Gadgets!',
    buttonText: 'Shop Electronics',
  ),
  BannerData(
    image: 'assets/images/grocery.png',
    text: 'Shop Your Daily Necessary!',
    buttonText: 'Shop Now',
  ),
  BannerData(
    image: 'assets/images/grocery.png',
    text: 'Find Trendy Clothes!',
    buttonText: 'Shop Clothes',
  ),
];
