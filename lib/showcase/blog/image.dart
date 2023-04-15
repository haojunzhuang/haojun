import 'package:flutter/material.dart';
import 'package:me/globals.dart';

class ImageWithCredit extends StatelessWidget {
  const ImageWithCredit(
      {required this.name,
      this.width,
      required this.credit,
      this.height,
      this.title,
      super.key});

  final String name;
  final double? width;
  final String credit;
  final double? height;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/' + name),
          title != null ? Text(title!, style: caption) : Container(),
          Text('Photo credit: ' + credit, style: bodySmall),
        ],
      ),
    );
  }
}
