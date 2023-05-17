import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lff_foodapp/models/provider_class.dart';

import '../../models/customer_class.dart';
import '../../models/user_class.dart';

class CustomerController extends GetxController {
  CustomerController(User user) {
    customer = Customer(user);
  }
  Customer customer = Customer.none();

  void setName(String name) {
    customer.name = name;
  }

  void setLocation(int location) {
    customer.location = location;
  }

  void setMaxDistance(double maxDist) {
    customer.maxDistance = maxDist;
  }
}
