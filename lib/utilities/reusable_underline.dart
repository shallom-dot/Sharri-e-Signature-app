import 'package:flutter/material.dart';

class TextWithUnderline extends StatelessWidget {
  final String text;
  final String? subtext;

  const TextWithUnderline({
    Key? key,
    required this.text,
    this.subtext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                letterSpacing: 1.5,
                height: 1.5,
              ),
            ),
            if (subtext != null)
              Text(
                subtext!,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF797A7B
),
                ),
              ),
          ],
        ),
        const SizedBox(height: 5), // Add spacing between text and underline
        Container(
          height: 2,
          color: Colors.black12, // Color of the underline
        ),
      ],
    );
  }
}
