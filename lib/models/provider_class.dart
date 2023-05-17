import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

import 'location_result_model.dart';
import 'user_class.dart';

enum OrgType { restaurant, catering, others }

class Provider extends User {
  Provider(User user) : super(phone: user.phone, type: UserType.provider);

  Provider.none()
      : super(
          phone: "",
        );

  String? name;
  OrgType? orgType;
  LocationResult pLocation = LocationResult(location: LatLng(0, 0));
  String contactNumber = "";
  String? secondaryNumber;
  TimeOfDay pickupTime = const TimeOfDay(hour: 21, minute: 0);
  double pricePerMeal = (50.0);
}
