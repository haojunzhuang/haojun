import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:me/globals.dart';

class TiltCard extends StatefulWidget {
  final String title;
  final String image;
  final Function onTap;

  const TiltCard(
      {required this.title, required this.image, required this.onTap, Key? key})
      : super(key: key);

  @override
  _TiltCardState createState() => _TiltCardState();
}

class _TiltCardState extends State<TiltCard>
    with SingleTickerProviderStateMixin {
  double _rotationX = 0;
  double _rotationY = 0;

  static const double _maxRotation = math.pi / 12; // 15 degrees in radians

  late AnimationController _resetController;
  late Animation<double> _resetAnimation;

  @override
  void initState() {
    super.initState();
    _resetController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _resetAnimation = Tween<double>(begin: 1, end: 0).animate(_resetController)
      ..addListener(() {
        setState(() {
          _rotationX *= _resetAnimation.value;
          _rotationY *= _resetAnimation.value;
        });
      });
  }

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
          _resetController.reset();
        },
        onExit: (event) {
          _resetController.forward();
        },
        child: Transform(
          transform: Matrix4.rotationX(_rotationX)..rotateY(_rotationY),
          alignment: FractionalOffset.center,
          child: GestureDetector(
            onTap: () {
              widget.onTap();
            },
            child: Container(
                width: 350,
                height: 280,
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                      color: const Color.fromARGB(255, 119, 4, 139), width: 5),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                      child: Image.asset('assets/images/${widget.image}'),
                    ),
                    const SizedBox(height: 20),
                    Text(widget.title, style: title3)
                  ],
                )),
          ),
        ));
  }

  @override
  void dispose() {
    _resetController.dispose();
    super.dispose();
  }
}
