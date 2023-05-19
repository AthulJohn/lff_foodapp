// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var count = 0.obs;
  increment() {
    if (count.value < 3) {
      count++;
    }
  }

  decrement() {
    if (count.value > 0) {
      count--;
    }
  }

  var select = 0.obs;
  selectVeg() {
    select.value = 0;
  }

  selectNonVeg() {
    select.value = 1;
  }
}

class CounterField extends StatelessWidget {
  const CounterField({super.key});

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              c.decrement();
            },
            icon: Icon(Icons.remove)),
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/svg_assets/counterfield.png",
              width: 50,
            ),
            Obx(() {
              return Text(c.count.value.toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
            }),
          ],
        ),
        IconButton(
            onPressed: () {
              c.increment();
            },
            icon: Icon(Icons.add)),
      ],
    );
  }
}

class foodPreference extends StatelessWidget {
  const foodPreference({super.key});

  // int select = 1;
  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());
    BoxDecoration b = const BoxDecoration(
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black54, blurRadius: 15.0, offset: Offset(0.0, 0.75))
      ],
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            c.selectVeg();
          },
          child: Obx(() {
            return Container(
              decoration: c.select.value == 0 ? b : null,
              child: Image.asset(
                "assets/svg_assets/veg.png",
                width: 125,
              ),
            );
          }),
        ),
        InkWell(
          onTap: () {
            c.selectNonVeg();
          },
          child: Obx(() {
            return Container(
              decoration: c.select.value == 1 ? b : null,
              child: Image.asset(
                "assets/svg_assets/nonveg.png",
                width: 125,
              ),
            );
          }),
        )
      ],
    );
  }
}

class LocationSelect extends StatelessWidget {
  const LocationSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {},
          child: Image.asset("assets/svg_assets/map_placeholder.png"),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {},
          child: Image.asset("assets/svg_assets/select_location_button.png"),
        )
      ],
    );
  }
}

class FinaliseOrder extends StatelessWidget {
  const FinaliseOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset("assets/svg_assets/order_finalise.png"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(() {
              return Text(
                c.select.value == 0 ? "Veg" : "Non-Veg",
                style: TextStyle(
                  color: Color(0xff01D38A),
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),
            Text(
              "Meals for",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Obx(() {
              return Text(
                c.count.value.toString(),
                style: TextStyle(
                  color: Color(0xff01D38A),
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),
            Text(
              "Serves",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}
