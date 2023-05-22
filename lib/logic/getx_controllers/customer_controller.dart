import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lff_foodapp/data/location_apis.dart';
import 'package:lff_foodapp/models/provider_class.dart';

import 'package:latlong2/latlong.dart';

import '../../models/customer_class.dart';
import '../../models/location_result_model.dart';
import '../../models/user_class.dart';

class CustomerController extends GetxController {
  CustomerController(User user) {
    customer = Customer(user);
  }
  Customer customer = Customer.none();

  void setName(String name) {
    customer.name = name;
  }

  void setMaxDistance(double maxDist) {
    customer.maxDistance = maxDist;
  }

  void setLocation(LatLng location) async {
    customer.location = LocationResult(location: location);
    update();
    customer.location = await LocationProvider.findInfo(location);
    update();
  }

  void setLocationWithInfo(LocationResult) async {
    customer.location = LocationResult;
    update();
  }

  bool get locationIsSet {
    return customer.location.location != LatLng(0, 0);
  }
}
