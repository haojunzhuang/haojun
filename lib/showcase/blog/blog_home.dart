import 'package:flutter/material.dart';
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
          SizedBox(width: 10),
          Container(
              color: Color.fromARGB(255, 255, 255, 255),
              width: 350,
              child: Center(
                  child: GradientText(
                'R4B Writer\'s Blog',
                style: TextStyle(
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
                padding: EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                    child: Padding(
                  padding: EdgeInsets.all(50),
                  child: Center(
                      child: TiltCard(
                    child: Container(
                      width: 300,
                      height: 200,
                      color: Colors.blue,
                    ),
                  )),
                ))),
          )
        ],
      ),
    );
  }
}

class TiltCard extends StatefulWidget {
  final Widget child;

  TiltCard({required this.child});

  @override
  _TiltCardState createState() => _TiltCardState();
}

class _TiltCardState extends State<TiltCard> {
  double _rotationX = 0;
  double _rotationY = 0;

  static const double _maxRotation = math.pi / 12; // 15 degrees in radians

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          _rotationX =
              (event.localPosition.dy - (context.size!.height / 2)) / 500;
          _rotationY =
              (event.localPosition.dx - (context.size!.width / 2)) / -500;
          _rotationX = _rotationX.clamp(-_maxRotation, _maxRotation);
          _rotationY = _rotationY.clamp(-_maxRotation, _maxRotation);
        });
      },
      onExit: (event) {
        setState(() {
          _rotationX = 0;
          _rotationY = 0;
        });
      },
      child: Transform(
        transform: Matrix4.rotationX(_rotationX)..rotateY(_rotationY),
        alignment: FractionalOffset.center,
        child: Card(
          elevation: 8,
          child: widget.child,
        ),
      ),
    );
  }
}
