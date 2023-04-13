import 'package:flutter/material.dart';
import 'package:me/showcase/blog/tile_card.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'dart:math' as math;

class BlogHome extends StatelessWidget {
  const BlogHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          const SizedBox(width: 10),
          Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              width: 350,
              child: Center(
                  child: GradientText(
                'R4B Writer\'s Blog',
                style: const TextStyle(
                    fontSize: 100.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto'),
                colors: const [
                  Color.fromARGB(255, 222, 158, 196),
                  Color.fromARGB(255, 201, 167, 226),
                  Color.fromARGB(255, 154, 159, 233)
                ],
              ))),
          // Padding(
          //   padding: EdgeInsets.symmetric(vertical: 50),
          //   child: VerticalDivider(
          //     color: Colors.black,
          //     thickness: 3,
          //   ),
          // ),
          Expanded(
            child: Container(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.all(50),
                        child: Center(
                          child: Wrap(
                              spacing: 100,
                              // runSpacing: 20,
                              children: [
                                TiltCard(
                                  title: 'Monogamy and Polygamy',
                                  image: 'animals.jpg',
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/blog/monogamy');
                                  },
                                ),
                                TiltCard(
                                  title: 'Dart',
                                  image: 'birdlove.jpg',
                                  onTap: () {},
                                ),
                              ]),
                        )))),
          )
        ],
      ),
    );
  }
}
