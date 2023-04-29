// simulation.dart
// After numb robots reproduce, their positions are randomized
// to prevent them from instantly reproducing again
// After love robots reproduce, they are moved out of the plain
//
// Conclusions
// numb society grows exponentially
// love society does not grow if base number is not large enough

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:me/globals.dart';
import 'package:me/showcase/robot/observe.dart';
import 'package:me/showcase/robot/robots.dart';

class LoveSimulation extends StatefulWidget {
  const LoveSimulation({super.key});

  @override
  SimulationState createState() => SimulationState();
}

class SimulationState extends State<LoveSimulation> {
  bool _isNumb = true;
  int initialPopulation = 100;
  int initialChildren = 30;
  double _numbKidSurvivalRate = 0.5;
  double _loveKidSurvivalRate = 2.0;

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

  bool started = false;
  Timer _timer = Timer.periodic(const Duration(milliseconds: 10), (_) => () {});

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
        initialPopulation,
        (index) =>
            Dot(_randomPosition(), Random().nextBool(), Random().nextInt(500)));
    _males = dots.where((dot) => dot.isMale).toList();
    _females = dots.where((dot) => !dot.isMale).toList();
    _kids = List.generate(initialChildren,
        (index) => Kid(Random().nextInt(179))); // Randomly generate kids' ages
    _stepCount = 0;
    _totalBorn = 0;
    _totalDead = 0;
    _totalMarried = 0;
  }

  void _stepSimulation() {
    if (_males.length >= 500) {
      _timer.cancel();
      started = false;
      return;
    }

    _stepCount++;
    _moveDots();
    _reproduce();
    _ageDots();
    setState(() {});
  }

  void _moveDots() {
    for (var dot in _males) {
      double dx = Random().nextDouble() * 10 - 5;
      double dy = Random().nextDouble() * 10 - 5;
      dot.position += Offset(dx, dy);
      dot.position = Offset(max(min(dot.position.dx, _plainWidth), 0),
          max(min(dot.position.dy, _plainHeight), 0));
    }
    for (var dot in _females) {
      double dx = Random().nextDouble() * 10 - 5;
      double dy = Random().nextDouble() * 10 - 5;
      dot.position += Offset(dx, dy);
      dot.position = Offset(max(min(dot.position.dx, _plainWidth), 0),
          max(min(dot.position.dy, _plainHeight), 0));
    }
  }

  void _reproduce() {
    List<Kid> infants = [];
    for (var male in _males) {
      Dot female = _females.firstWhere(
          (f) =>
              !f.isMarried &&
              f.canReproduce() &&
              _distance(male.position, f.position) < 5,
          orElse: () => Dot(const Offset(0, 0), true, -1));
      if (female.age != -1) {
        infants.addAll(female.reproduce(
            male, _isNumb, _numbKidSurvivalRate, _loveKidSurvivalRate));
        if (!_isNumb) {
          // if love, then remove two dots from the pool
          male.isMarried = true;
          female.isMarried = true;
          _married.add(male);
          _married.add(female);
          _males.remove(male);
          _females.remove(female);
          _totalMarried += 2;
        } else {
          //otherwise, randomize two dots' positions again
          male.position = _randomPosition();
          female.position = _randomPosition();
        }
      }
    }

    _totalBorn += infants.length;
    _kids.addAll(infants);
  }

  void _ageDots() {
    for (var dot in _males) {
      dot.ageOneStep();
      if (dot.age == 300) {
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
      if (dot.age == 300) {
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
          _males.add(Dot(_randomPosition(), true, 0));
        } else {
          _females.add(Dot(_randomPosition(), true, 0));
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
        title: const Text('Love Simulation'),
      ),
      body: Column(children: [
        SizedBox(
          height: 20,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  padding: EdgeInsets.all(10),
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
                )
              ]),
              SizedBox(width: 10),
              Column(
                children: [
                  Text('isNumb: ${_isNumb.toString()}'),
                  SizedBox(
                      width: size.width * 0.05,
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
                  Text('Initial Population: $initialPopulation'),
                  Slider(
                    activeColor: deepBlue,
                    inactiveColor: lightBlue,
                    value: initialPopulation.toDouble(),
                    min: 50,
                    max: 500,
                    divisions: 20,
                    label: "Initial Population",
                    onChanged: (value) {
                      setState(() {
                        initialPopulation = value.toInt();
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  Text('Initial Children Polulation: $initialChildren'),
                  Slider(
                    activeColor: deepBlue,
                    inactiveColor: lightBlue,
                    value: initialChildren.toDouble(),
                    min: 30,
                    max: 200,
                    divisions: 20,
                    label: "Initial Children Population",
                    onChanged: (value) {
                      setState(() {
                        initialChildren = value.toInt();
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                      'Numb offspring survival rate: ${_numbKidSurvivalRate.toStringAsFixed(2)}'),
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
                      'Love offspring average children: ${_loveKidSurvivalRate.toStringAsFixed(2)}'),
                  Slider(
                    activeColor: deepBlue,
                    inactiveColor: lightBlue,
                    value: _loveKidSurvivalRate,
                    min: 0,
                    max: 5,
                    divisions: 20,
                    label: _loveKidSurvivalRate.toStringAsFixed(2),
                    onChanged: (value) {
                      setState(() {
                        _loveKidSurvivalRate = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  !started
                      ? ElevatedButton(
                          onPressed: () {
                            started = true;
                            _initializeDots();
                            _timer = Timer.periodic(
                                Duration(milliseconds: _timestepMilliSeconds),
                                (timer) {
                              _stepSimulation();
                            });
                          },
                          child: const Text('Start New Simulation'))
                      : ElevatedButton(
                          onPressed: () {
                            started = false;
                            _timer.cancel();
                            setState(() {});
                          },
                          child: const Text('Stop Simulation'),
                        ),
                ],
              ),
              const SizedBox(width: 10),
              Column(
                children: [
                  Text('Steps: $_stepCount'),
                  Text('Total Unmarried Male: ${_males.length}'),
                  Text('Total Unmarried Female: ${_females.length}'),
                  Text('Total Children: ${_kids.length}'),
                  Text(
                      'Total Population: ${_males.length + _females.length + _kids.length}'),
                  Text('Total Born: $_totalBorn'),
                  Text('Total Married: $_totalMarried'),
                  Text('Total Dead: $_totalDead'),
                ],
              )
            ]),
        Row(
          children: [
            LiveUpdatedObserveChart(
                _males.length + _females.length + _kids.length)
          ],
        )
      ]),
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
