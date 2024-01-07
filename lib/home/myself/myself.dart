import 'package:flutter/material.dart';
import 'package:me/globals.dart';

class MyselfPage extends StatelessWidget {
  const MyselfPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(
          size.width * 0.2, size.height * 0.2, size.width * 0.2, 0),
      child: Column(
        children: [
          // const CircleAvatar(
          //   radius: 50,
          //   backgroundImage: AssetImage('assets/images/myself.jpeg'),
          // ),
          Container(
            width: size.width * 0.12,
            height: size.width * 0.12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.width * 0.02),
              image: const DecorationImage(
                image: AssetImage('assets/images/myself2.jpeg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.04),
          Text('Haojun Zhuang', style: title2),
          SizedBox(height: size.height * 0.02),
          Text(
            'Hi there! I am a junior studying computer science and bioengineering at Berkeley. My technical interests include software engineering, machine learning, simulation, and brain functions. When I am not coding, I enjoy basketball, cooking, and video games. Current video game rotations: FIFA 23, Deep Rock Galactic.',
            style: body,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
