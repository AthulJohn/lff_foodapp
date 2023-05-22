import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lff_foodapp/models/provider_class.dart';

import '../../models/customer_class.dart';
import '../../models/order_class.dart';
import '../../models/user_class.dart';

class OrderPageController extends GetxController {
  OrderPageController();
  int step = 0;

  void nextStep() {
    step = min(step + 1, 3);

    update();
  }

  void goToStep(int step) {
    this.step = step;

    update();
  }

  // void setLocation(int location) {
  //   customer.location = location;
  // }

  // void setMaxDistance(double maxDist) {
  //   customer.maxDistance = maxDist;
  // }
}
