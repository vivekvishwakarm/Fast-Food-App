
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../ui_helper/ui_helper.dart';

class ItemDetailsScreen extends StatefulWidget {
  const ItemDetailsScreen({super.key});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const CircleAvatar(
            backgroundColor: Colors.black38,
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundColor: Colors.black38,
              child: Icon(Icons.close, color: Colors.white),
            ),
            onPressed: () {},
          ),
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            SizedBox(
              width: width,
              height: height * 0.3,
              child: Center(
                child: Image.asset(
                  'assets/images/Image-1.jpg',
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Title and Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UiHelper.customText(
                  txt: 'Carbonare pasta',
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.orange,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 8),
            UiHelper.customText(
                txt: 'Smoked pork, Pecorino cheese, ground black pepper.',
                fontSize: 16,
                color: Colors.black),
            const SizedBox(height: 16),
            // Price
            Row(
              children: [
                UiHelper.customText(
                  txt: '€7,50',
                  fontSize: 20,
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(width: 8),
                const Text(
                  '€8,50',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Add more
            UiHelper.customText(
              txt: 'Add more',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 16),
            // Add more options
            Expanded(
              child: ListView(
                children: [
                  _buildAddOnItem(
                      'Parmesan cheese', '€2,50', 'assets/images/Image-1.jpg'),
                  _buildAddOnItem(
                      'Sauce', '€1,50', 'assets/images/Image-1.jpg'),
                  const Divider(),
                  UiHelper.customText(
                    txt: 'Package',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  _buildAddOnItem(
                      'Package box cost', '€0,50', 'assets/images/Image-1.jpg'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Quantity selector and add to order button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _buildQuantityButton(Icons.remove, () {
                      setState(() {
                        if (_quantity > 1) _quantity--;
                      });
                    }),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: UiHelper.customText(
                          txt: '$_quantity',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: secondaryColor),
                    ),
                    _buildQuantityButton(Icons.add, () {
                      setState(() {
                        _quantity++;
                      });
                    }),
                  ],
                ),
                UiHelper.create(
                  context: context,
                  text: 'Add to order',
                  onPressed: () {},
                  width: width * 0.3,
                  height: height * 0.06,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddOnItem(String title, String price, String image) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      leading: Image.asset(image, height: 40, width: 40),
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('+$price',style: const TextStyle(fontSize: 14),),
          const SizedBox(width: 8),
           Radio(

            value: null,
            groupValue: null,
            onChanged: null,
               fillColor: WidgetStateProperty. resolveWith<Color>((Set<WidgetState> states) {
                 if (states. contains(WidgetState. disabled)) {
                   return Colors. orange;
                 }
                 return Colors. orange;
               },),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey),
          color: secondaryColor),
      child: Center(
        child: IconButton(
          color: Colors.white,
          icon: Icon(icon),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
