import 'package:flutter/material.dart';

class StackedImageCard extends StatelessWidget {
  final String backgroundImagePath;
  final String foregroundImagePath;

  StackedImageCard({
    required this.backgroundImagePath,
    required this.foregroundImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 278, // Adjust the height as needed
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              margin: EdgeInsets.all(20), // Adjust margin to reduce size
              child: Image.asset(
                backgroundImagePath,
                fit: BoxFit.contain, // Use BoxFit.contain to ensure the full image is visible
              ),
            ),
          ),
          Positioned(
            left: 60,
            top: 90,
            child: Image.network(
              foregroundImagePath,
              width: 220,
              height: 200,
              fit: BoxFit.contain, // Use BoxFit.contain for the foreground image as well
            ),
          ),
        ],
      ),
    );
  }
}
