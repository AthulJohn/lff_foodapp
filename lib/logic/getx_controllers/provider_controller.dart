import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:latlong2/latlong.dart';
import 'package:lff_foodapp/data/location_apis.dart';
import 'package:lff_foodapp/models/location_result_model.dart';
import 'package:lff_foodapp/models/provider_class.dart';

import '../../models/user_class.dart';

class ProviderController extends GetxController {
  ProviderController(User user) {
    provider = Provider(user);
  }
  Provider provider = Provider.none();

  void setName(String name) {
    provider.name = name;
  }

  void setOrgType(OrgType orgType) {
    provider.orgType = orgType;
    update();
  }

  void setLocation(LatLng location) async {
    provider.pLocation = LocationResult(location: location);
    update();
    provider.pLocation = await LocationProvider.findInfo(location);
    update();
  }

  void setLocationWithInfo(LocationResult) async {
    provider.pLocation = LocationResult;
    update();
  }

  bool get locationIsSet {
    return provider.pLocation.location != LatLng(0, 0);
  }

  void setContactNumber(String contactNumber) {
    provider.contactNumber = contactNumber;
  }

  void setSecondaryNumber(String secondaryNumber) {
    provider.secondaryNumber = secondaryNumber;
  }

  void setPickupTime(TimeOfDay pickupTime) {
    provider.pickupTime = pickupTime;
  }

  void setPricePerMeal(double pricePerMeal) {
    provider.pricePerMeal = pricePerMeal;
  }
}
