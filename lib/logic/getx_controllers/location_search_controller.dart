import 'package:get/get.dart';
import 'package:lff_foodapp/data/location_apis.dart';
import 'package:lff_foodapp/models/location_result_model.dart';

import '../../models/user_class.dart';

enum SearchStatus { none, searching, done }

class LocationSearchController extends GetxController {
  List<LocationResult>? results = [];
  SearchStatus status = SearchStatus.none;
  String query = "";
  // LocationProvider locationApiProvider = LocationProvider();

  void searchPlace(String query) async {
    this.query = query;
    status = SearchStatus.searching;
    update();
    results = await LocationProvider.searchPlace(query);

    status = SearchStatus.done;
    update();
  }

  void setStatus(SearchStatus status) {
    this.status = status;
    update();
  }
}
