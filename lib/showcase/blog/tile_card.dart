import 'package:flutter/material.dart';
import 'dart:math' as math;

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
        child: Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(_rotationY * 30,
                    _rotationX * -30), // changes position of shadow
              )
            ],
            color: Colors.red,
            borderRadius: BorderRadius.circular(30),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
