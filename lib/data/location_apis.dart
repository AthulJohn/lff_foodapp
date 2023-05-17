import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lff_foodapp/models/location_result_model.dart';
import 'package:latlong2/latlong.dart';

abstract class LocationProvider {
  // To search for a place
  static Future<List<LocationResult>> searchPlace(String query) async {
    String url = Uri.encodeFull(
        "https://nominatim.openstreetmap.org/search?q=$query&format=json");
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    List<dynamic> body = json.decode(response.body);
    if (response.statusCode == 200) {
      List<LocationResult> results = [];
      for (Map<String, dynamic> result in body) {
        results.add(LocationResult(
          location: LatLng(double.tryParse(result["lat"]) ?? 0,
              double.tryParse(result["lon"]) ?? 0),
          info: result["display_name"],
          type: result["type"],
          typeImageUrl: result["icon"],
        ));
      }
      return results;
    }
    return [];
  }

  // To get information from latlong
  static Future<LocationResult> findInfo(LatLng location) async {
    String url = Uri.encodeFull(
        "https://nominatim.openstreetmap.org/reverse?lat=${location.latitude}&lon=${location.longitude}&format=jsonv2");
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    Map<String, dynamic> body = json.decode(response.body);
    if (response.statusCode == 200) {
      return LocationResult(
        location: LatLng(double.tryParse(body["lat"]) ?? 0,
            double.tryParse(body["lon"]) ?? 0),
        info: body["display_name"],
        type: body["type"],
        typeImageUrl: body["icon"],
      );
    }
    return LocationResult(
      location: location,
    );
  }
}
