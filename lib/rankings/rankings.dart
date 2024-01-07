import 'package:flutter/material.dart';
import 'package:me/globals.dart';

class RankingsPage extends StatelessWidget {
  const RankingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return  Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.all(height*.1), 
            child: SingleChildScrollView( child:
                Text('Under Construction', style: body,)
            )));
  }
}
