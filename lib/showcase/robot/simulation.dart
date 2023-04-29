import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class Dot {
  Offset position;
  bool isMale;
  bool isMarried = false;
  bool isPregnant = false;
  int age;
  int lastReproductionTime = 0;

  Dot(this.position, this.isMale, this.age);

  bool canReproduce() {
    return !isPregnant && age >= 18 && age <= 40;
  }

  Dot? reproduce(Dot partner, bool isNumb, double numbKidSurvivalRate,
      double loveKidSurvivalRate) {
    if (isNumb) {
      if (Random().nextDouble() < numbKidSurvivalRate) {
        return Dot(position, Random().nextBool(), 0);
      } else {
        return null;
      }
    } else {
      if (Random().nextDouble() < loveKidSurvivalRate) {
        return Dot(position, Random().nextBool(), 0);
      } else {
        return null;
      }
    }
  }

  void ageOneStep() {
    age++;
    if (isPregnant) {
      if (age - lastReproductionTime >= 9) {
        isPregnant = false;
        lastReproductionTime = age;
      }
    }
  }
}

class Kid {
  Offset position;
  int age;

  Kid(this.position, this.age);
  // Add methods for aging as needed
}

class LoveSimulation extends StatefulWidget {
  const LoveSimulation({super.key});

  @override
  SimulationState createState() => SimulationState();
}

class SimulationState extends State<LoveSimulation> {
  bool _isNumb = true;
  double _numbKidSurvivalRate = 0.5;
  double _loveKidSurvivalRate = 0.8;

  double _maleDotSize = 5.0;
  double _femaleDotSize = 5.0;
  double _kidDotSize = 3.0;
  double _plainWidth = 300.0;
  double _plainHeight = 300.0;
  int _timestepMilliSeconds = 1000;

  List<Dot> _dots = [];
  List<Dot> _males = [];
  List<Dot> _females = [];
  List<Dot> _married = [];
  List<Kid> _kids = [];
  int _stepCount = 0;

  Timer _timer = Timer.periodic(Duration(milliseconds: 50), (_) => () {});

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
    _dots = List.generate(
        100,
        (index) =>
            Dot(_randomPosition(), Random().nextBool(), Random().nextInt(500)));
    _males = _dots.where((dot) => dot.isMale).toList();
    _females = _dots.where((dot) => !dot.isMale).toList();
  }

  Offset _randomPosition() {
    return Offset(Random().nextDouble() * _plainWidth,
        Random().nextDouble() * _plainHeight);
  }

  // void _startSimulation() {
  //   _timer = Timer.periodic(Duration(milliseconds: 50), (_) => _runSimulation());
  // }

  void _stepSimulation() {
    _stepCount++;
    _moveDots();
    _reproduce();
    _ageDots();
    // _removeDeadDot();
    setState(() {});
  }

  void _moveDots() {
    for (var dot in _dots) {
      double dx = Random().nextDouble() * 10 - 5;
      double dy = Random().nextDouble() * 10 - 5;
      dot.position += Offset(dx, dy);
      dot.position = Offset(max(min(dot.position.dx, _plainWidth), 0),
          max(min(dot.position.dy, _plainHeight), 0));
    }
  }

  void _reproduce() {
    List<Dot> newDots = [];
    for (var male in _males) {
      if (!male.isMarried && male.canReproduce()) {
        Dot female = _females.firstWhere(
            (f) =>
                !f.isMarried &&
                f.canReproduce() &&
                _distance(male.position, f.position) < 10,
            orElse: () => Dot(Offset(0, 0), true, -1));

        if (female.age != -1) {
          Dot? child = male.reproduce(
              female, _isNumb, _numbKidSurvivalRate, _loveKidSurvivalRate);
          if (child != null) {
            if (Random().nextBool()) {
              newDots.add(child);
            } else {
              _kids.add(Kid(Offset(400, 100), 0));
            }
          }
          male.isMarried = true;
          female.isMarried = true;
          _married.add(male);
          _married.add(female);
        }
      }
    }
    _dots.addAll(newDots);
  }

  double _distance(Offset a, Offset b) {
    double dx = a.dx - b.dx;
    double dy = a.dy - b.dy;
    return sqrt(dx * dx + dy * dy);
  }

  void _ageDots() {
    for (var dot in _dots) {
      dot.ageOneStep();
      if (dot.age == 500) {
        if (dot.isMarried) {
          _married.remove(dot);
        }
        _dots.remove(dot);
      }
    }
    for (var kid in _kids) {
      kid.age++;
      if (kid.age == 180) {
        _dots.add(Dot(kid.position, Random().nextBool(), 0));
        _kids.remove(kid);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  for (var dot in _dots)
                    Positioned(
                      left: dot.position.dx -
                          (dot.isMale ? _maleDotSize / 2 : _femaleDotSize / 2),
                      top: dot.position.dy -
                          (dot.isMale ? _maleDotSize / 2 : _femaleDotSize / 2),
                      child: Container(
                        width: dot.isMale ? _maleDotSize : _femaleDotSize,
                        height: dot.isMale ? _maleDotSize : _femaleDotSize,
                        decoration: BoxDecoration(
                          color: dot.isMale ? Colors.blue : Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  for (var kid in _kids)
                    Positioned(
                      left: kid.position.dx - _kidDotSize / 2,
                      top: kid.position.dy - _kidDotSize / 2,
                      child: Container(
                        width: _kidDotSize,
                        height: _kidDotSize,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('isNumb: ${_isNumb.toString()}'),
            Slider(
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
            ),
            SizedBox(height: 10),
            Text(
                'Numb Kid Survival Rate: ${_numbKidSurvivalRate.toStringAsFixed(2)}'),
            Slider(
              value: _numbKidSurvivalRate,
              min: 0,
              max: 1,
              divisions: 10,
              label: _numbKidSurvivalRate.toStringAsFixed(2),
              onChanged: (value) {
                setState(() {
                  _numbKidSurvivalRate = value;
                });
              },
            ),
            SizedBox(height: 10),
            Text(
                'Love Kid Survival Rate: ${_loveKidSurvivalRate.toStringAsFixed(2)}'),
            Slider(
              value: _loveKidSurvivalRate,
              min: 0,
              max: 1,
              divisions: 10,
              label: _loveKidSurvivalRate.toStringAsFixed(2),
              onChanged: (value) {
                setState(() {
                  _loveKidSurvivalRate = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _timer.cancel();
                _initializeDots();
                _timer = Timer.periodic(
                    Duration(milliseconds: _timestepMilliSeconds), (timer) {
                  _stepSimulation();
                });
              },
              child: Text('Start Simulation'),
            ),
          ],
        ),
      ),
    );
  }
}
