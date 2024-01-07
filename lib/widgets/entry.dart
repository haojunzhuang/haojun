import 'package:flutter/material.dart';
import 'package:me/globals.dart';
import 'package:url_launcher/url_launcher.dart';

class Entry extends StatelessWidget {
  final String title;
  final String text;
  final void Function() onPressed;

  const Entry(
      {required this.title,
      required this.text,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: onPressed,
          child: Text(title, style: bodyBold),
        ),
        Text(text, style: body),
        const SizedBox(height: 10,),
      ],
    );
  }
}
