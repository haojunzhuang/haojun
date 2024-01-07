import 'package:flutter/material.dart';

class RankingsPage extends StatelessWidget {
  const RankingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return const Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Padding(
            padding: EdgeInsets.all(10.0), 
            child: SingleChildScrollView(

            )));
  }
}
