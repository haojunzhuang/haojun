import 'package:flutter/material.dart';
import 'package:me/globals.dart';
import 'package:me/showcase/robot/simulation.dart';

class ShowcasePage extends StatelessWidget {
  const ShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(children: [
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/blog');
                },
                child: const Text(
                  'R4B Writer\'s blog',
                  style: TextStyle(color: Colors.white),
                )),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/simulations/love');
                },
                child: const Text(
                  'Love Simulation',
                  style: TextStyle(color: Colors.white),
                )),
          ]),
        ));
  }
}
