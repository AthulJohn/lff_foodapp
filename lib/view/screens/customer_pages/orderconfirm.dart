// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lff_foodapp/navigation/routes.dart';

import '../../components/orderwidgets.dart';

class OrderConfirm extends StatelessWidget {
  final int veg;
  final int serves;
  const OrderConfirm({super.key, required this.veg, required this.serves});

  @override
  Widget build(BuildContext context) {
    int amount = veg == 0 ? 50 * serves : 70 * serves;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Image.asset('assets/svg_assets/order_placed.png'),
          ),
          Expanded(
            flex: 1,
            child: const Text(
              "Your order will be ready for pickup at",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Image.asset(
                  "assets/svg_assets/order_details_rect.png",
                  width: MediaQuery.of(context).size.width * 0.9,
                ),
                Positioned(
                  top: 5,
                  right: 200,
                  child: Image.asset(
                    "assets/svg_assets/hotel_image_placeholder.png",
                    width: 200,
                    height: 125,
                  ),
                ),
                Positioned(
                  top: 15,
                  left: 120,
                  child: Text(
                    "Cafe Manara Restaurant",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 120,
                  child: Text(
                    "Kothamangalam",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Positioned(
                  top: 65,
                  left: 120,
                  child: Text(
                    "⭐3.6",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 110,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          "assets/svg_assets/know_more.png",
                          width: 120,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          "assets/svg_assets/locate.png",
                          width: 120,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Text(
                  "You order will cost you",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontFamily: 'sunflower',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "₹" + amount.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 48,
                    fontFamily: 'sunflower',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Image.asset(
                  "assets/svg_assets/order_table.png",
                  width: MediaQuery.of(context).size.width * 0.9,
                ),
                Positioned(
                  top: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          veg == 0 ? "Veg Meal" : "Non-Veg Meal",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: veg == 0 ? 90 : 60,
                      ),
                      Text(
                        veg == 0
                            ? "50 \t\t\t\t\t\t\t\t\t\t\t\t\t$serves\t\t\t\t\t\t\t\t\t\t\t\t\t $amount"
                            : "70 \t\t\t\t\t\t\t\t\t\t\t\t\t$serves\t\t\t\t\t\t\t\t\t\t\t\t\t $amount",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed("/customerHome");
                  },
                  child: Image.asset(
                    "assets/svg_assets/cancel_order.png",
                    width: 150,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.offAllNamed(Routes.customerHome);
                  },
                  child: Image.asset(
                    "assets/svg_assets/leave_button.png",
                    width: 150,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
