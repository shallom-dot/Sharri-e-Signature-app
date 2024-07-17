import 'package:flutter/material.dart';
import 'package:sharries_signature/screens/productdetails.dart';

class ProductCard extends StatelessWidget {
  final String text;
  final String price;

  const ProductCard({
    Key? key,
    required this.text,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      width: 180,
      height: 210, // Set a fixed width for each card
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/card1.png', // Replace with your image asset path
            fit: BoxFit.cover,
            width: double.infinity, // Image takes full width of the card
            height: 160, // Adjust height as needed
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 8), // Add spacing between title and price
                    Text(
                      price, // Replace with actual price data
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductDetails()),
                    );
                  },
                  style: TextButton.styleFrom(
                    side: BorderSide(
                        color: Colors.green, width: 1), // Green outline
                    // Green text
                    backgroundColor: Colors.white, // White background
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8)), // Border radius 8
                  ),
                  child: Text(
                    'Add to cart',
                    style: TextStyle(fontSize: 7.1, height: 0.6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
