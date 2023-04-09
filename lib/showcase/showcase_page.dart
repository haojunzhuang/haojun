import 'package:flutter/material.dart';

class ShowcasePage extends StatelessWidget {
  const ShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/blog');
            },
            child: const Text('R4B Writer\'s blog'))
      ]),
    );
  }
}
