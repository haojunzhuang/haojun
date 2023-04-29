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
