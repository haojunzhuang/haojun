import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:me/globals.dart';
import 'package:me/showcase/robot/robots.dart';

class LoveSimulation extends StatefulWidget {
  const LoveSimulation({super.key});

  @override
  SimulationState createState() => SimulationState();
}

class SimulationState extends State<LoveSimulation> {
  bool _isNumb = true;
  double _numbKidSurvivalRate = 0.5;
  double _loveKidSurvivalRate = 0.8;

  final double _maleDotSize = 5.0;
  final double _femaleDotSize = 5.0;
  final double _plainWidth = 300.0;
  final double _plainHeight = 300.0;
  final int _timestepMilliSeconds = 100;

  List<Dot> _males = [];
  List<Dot> _females = [];
  List<Dot> _married = [];
  List<Kid> _kids = [];

  // observed variables
  int _stepCount = 0;
  int _totalBorn = 0;
  int _totalDead = 0;
  int _totalMarried = 0;

  Timer _timer = Timer.periodic(const Duration(milliseconds: 50), (_) => () {});

  @override
  void initState() {
    super.initState();
    _initializeDots();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _initializeDots() {
    List<Dot> dots = List.generate(
        100,
        (index) =>
            Dot(_randomPosition(), Random().nextBool(), Random().nextInt(500)));
    _males = dots.where((dot) => dot.isMale).toList();
    _females = dots.where((dot) => !dot.isMale).toList();
  }

  void _stepSimulation() {
    _stepCount++;
    _moveDots();
    _reproduce();
    _ageDots();
    setState(() {});
  }

  void _moveDots() {
    for (var dot in _males) {
      double dx = Random().nextDouble() * 20 - 10;
      double dy = Random().nextDouble() * 20 - 10;
      dot.position += Offset(dx, dy);
      dot.position = Offset(max(min(dot.position.dx, _plainWidth), 0),
          max(min(dot.position.dy, _plainHeight), 0));
    }
    for (var dot in _females) {
      double dx = Random().nextDouble() * 20 - 10;
      double dy = Random().nextDouble() * 20 - 10;
      dot.position += Offset(dx, dy);
      dot.position = Offset(max(min(dot.position.dx, _plainWidth), 0),
          max(min(dot.position.dy, _plainHeight), 0));
    }
  }

  void _reproduce() {
    List<Dot> infants = [];
    for (var male in _males) {
      Dot female = _females.firstWhere(
          (f) =>
              !f.isMarried &&
              f.canReproduce() &&
              _distance(male.position, f.position) < 10,
          orElse: () => Dot(const Offset(0, 0), true, -1));
      if (female.age != -1) {
        Dot? infant = female.reproduce(
            male, _isNumb, _numbKidSurvivalRate, _loveKidSurvivalRate);
        if (infant != null) {
          infants.add(infant);
        }
        if (!_isNumb) {
          male.isMarried = true;
          female.isMarried = true;
          _married.add(male);
          _married.add(female);
          _males.remove(male);
          _females.remove(female);
          _totalMarried += 2;
        }
      }
    }

    _totalBorn += infants.length;
    _kids.addAll(infants as Iterable<Kid>);
  }

  void _ageDots() {
    for (var dot in _males) {
      dot.ageOneStep();
      if (dot.age == 500) {
        if (dot.isMarried) {
          _married.remove(dot);
          _totalMarried--;
        }
        _males.remove(dot);
        _totalDead++;
      }
    }
    for (var dot in _females) {
      dot.ageOneStep();
      if (dot.age == 500) {
        if (dot.isMarried) {
          _married.remove(dot);
          _totalMarried--;
        }
        _females.remove(dot);
        _totalDead++;
      }
    }
    for (var kid in _kids) {
      kid.age++;
      if (kid.age == 180) {
        bool isMale = Random().nextBool();
        if (isMale) {
          _males.add(Dot(kid.position, true, 0));
        } else {
          _females.add(Dot(kid.position, true, 0));
        }
        _kids.remove(kid);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Simulation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: _plainWidth,
              height: _plainHeight,
              child: Stack(
                children: [
                  for (var dot in _males)
                    Positioned(
                      left: dot.position.dx,
                      top: dot.position.dy,
                      child: Container(
                        width: _maleDotSize,
                        height: _maleDotSize,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  for (var dot in _females)
                    Positioned(
                      left: dot.position.dx,
                      top: dot.position.dy,
                      child: Container(
                        width: _femaleDotSize,
                        height: _femaleDotSize,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text('isNumb: ${_isNumb.toString()}'),
            SizedBox(
                width: size.width * 0.1,
                child: Slider(
                  activeColor: deepBlue,
                  inactiveColor: lightBlue,
                  value: _isNumb ? 1 : 0,
                  min: 0,
                  max: 1,
                  divisions: 1,
                  label: _isNumb ? 'Numb' : 'Love',
                  onChanged: (value) {
                    setState(() {
                      _isNumb = value.round() == 1;
                    });
                  },
                )),
            const SizedBox(height: 10),
            Text(
                'Numb Kid Survival Rate: ${_numbKidSurvivalRate.toStringAsFixed(2)}'),
            Slider(
              activeColor: deepBlue,
              inactiveColor: lightBlue,
              value: _numbKidSurvivalRate,
              min: 0,
              max: 1,
              divisions: 20,
              label: _numbKidSurvivalRate.toStringAsFixed(2),
              onChanged: (value) {
                setState(() {
                  _numbKidSurvivalRate = value;
                });
              },
            ),
            const SizedBox(height: 10),
            Text(
                'Love Kid Survival Rate: ${_loveKidSurvivalRate.toStringAsFixed(2)}'),
            Slider(
              activeColor: deepBlue,
              inactiveColor: lightBlue,
              value: _loveKidSurvivalRate,
              min: 0,
              max: 1,
              divisions: 20,
              label: _loveKidSurvivalRate.toStringAsFixed(2),
              onChanged: (value) {
                setState(() {
                  _loveKidSurvivalRate = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _timer.cancel();
                _initializeDots();
                _timer = Timer.periodic(
                    Duration(milliseconds: _timestepMilliSeconds), (timer) {
                  _stepSimulation();
                });
              },
              child: const Text('Start Simulation'),
            ),
          ],
        ),
      ),
    );
  }

  Offset _randomPosition() {
    return Offset(Random().nextDouble() * _plainWidth,
        Random().nextDouble() * _plainHeight);
  }

  double _distance(Offset a, Offset b) {
    double dx = a.dx - b.dx;
    double dy = a.dy - b.dy;
    return sqrt(dx * dx + dy * dy);
  }
}
