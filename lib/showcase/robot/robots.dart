import 'dart:math';

import 'package:flutter/animation.dart';

class Dot {
  Offset position;
  bool isMale;
  bool isMarried = false;
  bool isPregnant = false;
  int age;
  int lastReproductionTime = 0;

  Dot(this.position, this.isMale, this.age);

  bool canReproduce() {
    return isMale || !isPregnant;
  }

  List<Kid> reproduce(Dot partner, bool isNumb, double numbKidSurvivalRate,
      double loveKidSurvivalRate) {
    if (isNumb) {
      if (Random().nextDouble() < numbKidSurvivalRate) {
        return [Kid(0)];
      } else {
        return [];
      }
    } else {
      List<Kid> result = [];
      while (Random().nextDouble() < loveKidSurvivalRate) {
        result.add(Kid(0));
        loveKidSurvivalRate -= 1;
      }
      return result;
    }
  }

  void ageOneStep() {
    age++;
    if (isPregnant) {
      if (age - lastReproductionTime >= 12) {
        isPregnant = false;
        lastReproductionTime = age;
      }
    }
  }
}

class Kid {
  int age;

  Kid(this.age);
  // Add methods for aging as needed
}
