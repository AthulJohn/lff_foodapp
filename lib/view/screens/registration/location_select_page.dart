import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:lff_foodapp/constants/appColors.dart';
import 'package:lff_foodapp/logic/getx_controllers/customer_controller.dart';
import 'package:lff_foodapp/logic/getx_controllers/provider_controller.dart';
import 'package:lff_foodapp/models/customer_class.dart';
import 'package:lff_foodapp/models/user_class.dart';
import 'package:lff_foodapp/view/components/cards/location_card.dart';
import 'package:lff_foodapp/view/components/buttons/proceed_button.dart';

import '../../../logic/getx_controllers/location_search_controller.dart';
import '../../components/title_text.dart';

class LocationSelectorPage extends StatelessWidget {
  const LocationSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserType userType = Get.arguments["type"];
    LocationSearchController locationSearchController =
        Get.put(LocationSearchController());

    MapController mapController = MapController();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TitleText(
              blackText: userType == UserType.customer
                  ? "Select your default"
                  : "Select your pickup",
              greenText: "LOCATION",
              size: 30,
            ),
          ),
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.topCenter,
              children: [
                if (userType == UserType.customer)
                  GetBuilder<CustomerController>(builder: (controller) {
                    return MapWidget(
                      isCustomer: true,
                      mapController: mapController,
                    );
                  })
                else if (userType == UserType.provider)
                  GetBuilder<ProviderController>(builder: (controller) {
                    return MapWidget(
                      mapController: mapController,
                    );
                  }),
                Stack(
                  fit: StackFit.loose,
                  children: [
                    SizedBox(
                      height: 50,
                      child: Column(children: [
                        Expanded(
                            child: Container(
                          color: Colors.white,
                        )),
                        Spacer()
                      ]),
                    ),
                    GetBuilder<LocationSearchController>(builder: (controller) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextField(
                            onChanged: (val) {
                              locationSearchController.searchPlace(val);
                            },
                            decoration: InputDecoration(
                                hintText: "Search Location",
                                prefixIcon: const Icon(Icons.search),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        color: AppColors.borderColor)),
                                filled: true,
                                fillColor: Colors.white),
                          ),
                          if (locationSearchController.status ==
                              SearchStatus.searching) // Add getbuilder
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              padding: EdgeInsets.all(8),
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          if (locationSearchController.status ==
                                  SearchStatus.done &&
                              locationSearchController.results != null)
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              height: Get.height * 0.3,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    locationSearchController.results!.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    onTap: () {
                                      if (userType == UserType.customer) {
                                        Get.find<CustomerController>()
                                            .setLocationWithInfo(
                                                locationSearchController
                                                    .results![index]);
                                      } else {
                                        Get.find<ProviderController>()
                                            .setLocationWithInfo(
                                                locationSearchController
                                                    .results![index]);
                                      }
                                      mapController.move(
                                          locationSearchController
                                              .results![index].location,
                                          mapController.zoom);
                                      controller.setStatus(SearchStatus.none);
                                    },
                                    // leading: locationSearchController
                                    //             .results![index].typeImageUrl ==
                                    //         null
                                    //     ? null
                                    //     : Image.network(locationSearchController
                                    //         .results![index].typeImageUrl!),
                                    title: Text(
                                      locationSearchController
                                              .results![index].info ??
                                          "-",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    subtitle: Text(locationSearchController
                                            .results![index].type ??
                                        "-"),
                                  );
                                },
                              ),
                            ),
                        ],
                      );
                    }),
                  ],
                  // ),
                ),
                Positioned(
                  bottom: 8,
                  child: userType == UserType.customer
                      ? GetBuilder<CustomerController>(builder: (controller) {
                          CustomerController customerController =
                              Get.find<CustomerController>();

                          return Column(
                            children: [
                              if (customerController.locationIsSet)
                                LocationCard(
                                    pLocation:
                                        customerController.customer.location),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ContinueButton(
                                  onPressed: customerController.locationIsSet
                                      ? () {
                                          Get.back();
                                        }
                                      : null,
                                  text: "Confirm",
                                  icon: Icons.check,
                                ),
                              ),
                            ],
                          );
                        })
                      : GetBuilder<ProviderController>(builder: (controller) {
                          ProviderController providerController =
                              Get.find<ProviderController>();
                          return Column(
                            children: [
                              if (providerController.locationIsSet)
                                LocationCard(
                                    pLocation:
                                        providerController.provider.pLocation),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ContinueButton(
                                  onPressed: providerController.locationIsSet
                                      ? () {
                                          Get.back();
                                        }
                                      : null,
                                  text: "Confirm",
                                  icon: Icons.check,
                                ),
                              ),
                            ],
                          );
                        }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MapWidget extends StatelessWidget {
  const MapWidget(
      {super.key, required this.mapController, this.isCustomer = false});
  final bool isCustomer;
  final MapController mapController;

  @override
  Widget build(BuildContext context) {
    CustomerController customerController = CustomerController(User(phone: ""));

    ProviderController providerController = ProviderController(User(phone: ""));
    if (isCustomer) {
      customerController = Get.find<CustomerController>();
    } else {
      providerController = Get.find<ProviderController>();
    }

    return FlutterMap(
      options: MapOptions(
        center: (isCustomer
            ? (customerController.locationIsSet
                ? customerController.customer.location.location
                : LatLng(10.024374, 76.307963))
            : (providerController.locationIsSet
                ? providerController.provider.pLocation.location
                : LatLng(10.024374, 76.307963))),
        zoom: 13,
        maxZoom: 18,
        onTap: (tapPosition, point) {
          isCustomer
              ? customerController.setLocation(point)
              : providerController.setLocation(point);
        },
      ),
      mapController: mapController,
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(
          markers: [
            if (isCustomer
                ? (customerController.locationIsSet)
                : providerController.locationIsSet)
              Marker(
                width: 80.0,
                height: 80.0,
                point: (isCustomer
                    ? (customerController.customer.location.location)
                    : providerController.provider.pLocation.location),
                builder: (ctx) => Container(
                  child: Icon(
                    Icons.location_on,
                    color: Colors.black,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class MapProceed extends StatelessWidget {
  const MapProceed(this.isCustomer, {super.key});
  final bool isCustomer;

  @override
  Widget build(BuildContext context) {
    CustomerController customerController = CustomerController(User(phone: ""));

    ProviderController providerController = ProviderController(User(phone: ""));
    if (isCustomer) {
      customerController = Get.find<CustomerController>();
    } else {
      providerController = Get.find<ProviderController>();
    }
    return Column(
      children: [
        if (isCustomer
            ? (customerController.locationIsSet)
            : providerController.locationIsSet)
          LocationCard(
              pLocation: isCustomer
                  ? (customerController.customer.location)
                  : providerController.provider.pLocation),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ContinueButton(
            onPressed: (isCustomer
                    ? (customerController.locationIsSet)
                    : providerController.locationIsSet)
                ? () {
                    Get.back();
                  }
                : null,
            text: "Confirm",
            icon: Icons.check,
          ),
        ),
      ],
    );
  }
}
