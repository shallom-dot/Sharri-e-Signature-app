import 'package:flutter/material.dart';

class ImageTextCard extends StatelessWidget {
  final String imagePath;
  final String text;

  const ImageTextCard({
    Key? key,
    required this.imagePath,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath, // Image path
          fit: BoxFit.cover,
          width: double.infinity,
          height:200, // Adjust height as needed
        ),
        SizedBox(height: 8), // Space between image and text
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center, // Center align text
        ),
      ],
    );
  }
}
