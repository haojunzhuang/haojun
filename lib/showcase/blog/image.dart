import 'package:flutter/material.dart';
import 'package:me/globals.dart';

class ImageWithCredit extends StatelessWidget {
  const ImageWithCredit({required this.width, required this.credit, super.key});

  final double width;
  final String credit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/animals.jpg'),
          Text('Photo credit: ' + credit, style: bodySmall),
        ],
      ),
    );
  }
}
