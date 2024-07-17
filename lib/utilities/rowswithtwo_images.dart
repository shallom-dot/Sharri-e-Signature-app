import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RowWithTwoImages extends StatelessWidget {
  final String imagePath1;
  final String imagePath2;

  const RowWithTwoImages({
    Key? key,
    required this.imagePath1,
    required this.imagePath2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Image.asset(
            imagePath1,
            width: 200, 
            height: 200, 
          ),
        ),
        Expanded(
          child: Image.asset(
            imagePath2,
            width: 200, 
            height: 200, 
          ),
        ),
      ],
    );
  }
}