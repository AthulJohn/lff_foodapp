import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:latlong2/latlong.dart';

import 'location_result_model.dart';
import 'user_class.dart';

enum OrgType { restaurant, catering, others }

class Customer extends User {
  Customer(User user) : super(phone: user.phone, type: UserType.customer);

  Customer.none()
      : super(
          phone: "",
        );

  String? name;
  LocationResult location = LocationResult(location: LatLng(0, 0));
  double maxDistance = 10;
}
