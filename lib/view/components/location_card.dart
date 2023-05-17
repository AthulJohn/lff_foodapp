import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:lff_foodapp/models/location_result_model.dart';

import '../../constants/appColors.dart';

class LocationCard extends StatelessWidget {
  const LocationCard(
      {super.key,
      required this.pLocation,
      this.hasMap = false,
      this.isSelected = false,
      this.onTap});
  final bool hasMap, isSelected;
  final VoidCallback? onTap;
  final LocationResult pLocation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width - 20,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: isSelected ? AppColors.primaryColor : AppColors.borderColor,
            width: isSelected ? 2 : 1),
      ),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              if (hasMap)
                Expanded(
                    child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: AppColors.borderColor, width: 1),
                    ),
                    child: Stack(
                      children: [
                        FlutterMap(
                          options: MapOptions(
                            center: pLocation.location,
                            zoom: 10,
                            interactiveFlags: InteractiveFlag.none,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                              userAgentPackageName: 'com.example.app',
                            ),
                          ],
                        ),
                        const Center(
                          child: Icon(
                            Icons.circle_outlined,
                            size: 10,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                )),
              Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pLocation.info ?? "-",
                        style: const TextStyle(fontSize: 15),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(pLocation.type ?? "-",
                          style: const TextStyle(
                              fontSize: 12, color: Colors.grey)),
                    ],
                  )),
            ],
          )),
    );
  }
}
