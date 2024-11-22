import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../ui_helper/ui_helper.dart';
import 'Item_details_screen.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  // List of banner image
  final List<String> bannerImages = [
    'assets/images/Image-3.jpg',
    'assets/images/Image-3.jpg',
    'assets/images/Image-3.jpg',
    'assets/images/Image-3.jpg',
  ];

  // Current index of the banner
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            const Icon(Icons.home, color: Colors.orange),
            SizedBox(width: width * 0.04),
            UiHelper.customText(
                txt: 'Home, Jl. Soekarno Hatta 15A',
                color: Colors.black,
                fontSize: 16),
            const Icon(Icons.arrow_drop_down, color: Colors.red),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width,
              height: height * 0.2,
              margin: EdgeInsets.symmetric(
                  horizontal: width * 0.02), // Fixed size container
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: CarouselSlider(
                items: bannerImages.map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 4),
                  enlargeCenterPage: true,
                  viewportFraction: 1.0, // Full width swipe
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Dots Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: bannerImages.map((url) {
                int index = bannerImages.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 2.0,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index ? Colors.orange : Colors.grey,
                  ),
                );
              }).toList(),
            ),

            // Fastest Delivery Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UiHelper.customText(
                    txt: 'Fastest delivery 🔥',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  UiHelper.customTextButton(
                    text: 'See all',
                    callBack: () {},
                    color: secondaryColor,
                  ),
                ],
              ),
            ),

            // Fast Delivery Items
            SizedBox(
              height: height * 0.25,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildFoodCard(
                      'Crazy Tacko',
                      'Delicouse tackos, appetizing snacks...',
                      '€3.00',
                      '40-50min',
                      '9.5',
                      'assets/images/tacko.png',
                      width * 0.8),
                  _buildFoodCard(
                      'La Salad',
                      'Fresh and tasty salad...',
                      '€2.00',
                      '30-40min',
                      '8.5',
                      'assets/images/salad.png',
                      width * 0.8),
                  _buildFoodCard(
                      'Crazy Tacko',
                      'Delicouse tackos, appetizing snacks...',
                      '€3.00',
                      '40-50min',
                      '9.5',
                      'assets/images/tacko.png',
                      width * 0.8),
                ],
              ),
            ),

            // Popular Items Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular items 👏',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See all',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ],
              ),
            ),

            // Popular Items List
            SizedBox(
              height: height * 0.25,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildFoodCard(
                      'Noodles',
                      'Tasty noodles with veggies...',
                      '€4.00',
                      '20-30min',
                      '9.0',
                      'assets/images/noodles.png',
                      width * 0.5),
                  _buildFoodCard(
                      'Burger',
                      'Cheesy beef burger...',
                      '€5.00',
                      '25-35min',
                      '9.2',
                      'assets/images/burger.png',
                      width * 0.5),
                  _buildFoodCard(
                      'Burger',
                      'Cheesy beef burger...',
                      '€5.00',
                      '25-35min',
                      '9.2',
                      'assets/images/burger.png',
                      width * 0.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodCard(String title, String subtitle, String price,
      String time, String rating, String image, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ItemDetailsScreen(),
            ),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Container(
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('assets/images/image-12.jpg'),
                fit: BoxFit.cover,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UiHelper.customText(
                        txt: title,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      UiHelper.customText(
                        txt: subtitle,
                        fontSize: 14,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          UiHelper.customText(
                            txt: price,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          UiHelper.customText(
                            txt: '$time • ⭐ $rating',
                            fontSize: 12,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
