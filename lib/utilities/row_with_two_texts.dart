import 'package:flutter/material.dart';

class RowWithTwoTexts extends StatelessWidget {
  final String text1;
  final String text2;

  const RowWithTwoTexts({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        Text(
          text2,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
