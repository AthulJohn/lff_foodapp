import 'package:latlong2/latlong.dart';

class LocationResult {
  LatLng location;
  String? info, type, typeImageUrl;

  LocationResult(
      {required this.location, this.info, this.type, this.typeImageUrl});
}
